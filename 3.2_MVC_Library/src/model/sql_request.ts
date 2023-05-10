
import { Request } from "express";
import { pool } from "./sql_connect";


import { IB_id, IA_id } from "../interfaces/interfaces"

export const sql_req = {
    updateBookViews: `UPDATE books SET count_search=?  WHERE b_id = ?;`,
    getCountClickBook: `SELECT count_click FROM books WHERE b_id = ?;`,
    addingClicks: `UPDATE books SET count_click=?  WHERE b_id = ?;`,
    addBook: `insert into books (title,link_image,descr,year,count_pages) values (?,?,?,?,?);`,
    addAuthor: `insert into authors (author) values (?);`,
    joinTables: `insert into books_authors(book_id,author_id) value (?,?);`,
    findNewBookId: "select books.b_id from books where title = ?;",
    findNewAuthorId: "select a_id from authors where author = ?;",
    markDeleteJoinAuthorBook: `UPDATE books_authors SET deleted = true WHERE book_id=?;`,
    deleteJoinAuthorBook: `DELETE from books_authors WHERE deleted = true;`,
    markDeletedBook: `UPDATE books SET deleted = true WHERE b_id=?;`,
    deleteBook: `DELETE from books WHERE deleted = true;`,
    editBook: `UPDATE books SET title=?, year=?  WHERE b_id = ?;`,
    countBooks: 'SELECT COUNT(*) AS count FROM books WHERE deleted = false; ',
    getAllAuthors: `SELECT * FROM authors;`,
    getPages:
        `SELECT books.*,group_concat(DISTINCT authors.author) as author
        FROM books 
        JOIN books_authors ba ON ba.book_id = books.b_id 
        JOIN authors ON ba.author_id = authors.a_id 
        WHERE books.deleted = false
        GROUP BY books.b_id
        LIMIT ?,?;`,
    getOneBook:
        `SELECT books.*,group_concat(DISTINCT authors.author) as author 
FROM books 
JOIN books_authors ba ON ba.book_id = books.b_id 
JOIN authors ON ba.author_id = authors.a_id 
WHERE books.b_id =?;`,
    searchBook:
        `SELECT  books.*,group_concat(DISTINCT authors.author) as author 
FROM books 
JOIN books_authors ba ON ba.book_id = books.b_id 
JOIN authors ON ba.author_id = authors.a_id 
WHERE books.title LIKE ?
AND books.deleted = false 
GROUP BY books.b_id;`,  //,books.title authors.author
    findAuthor: `SELECT authors.a_id FROM authors WHERE author LIKE ?;`,
}

/**
 * 
 * @param query description MySQL request to db 
 * @param args not necessarily arguments
 * @returns array of different data
 */
export async function requestDataBase(query: string, args?: string[] | number[]) {
    return await new Promise((resolve, reject) => {
        pool.getConnection((err, connection) => {
            connection.query(query, args, function (err, results) {
                err ? reject(err) : resolve(results)
                connection.release();
            });
        });
    });
}

/**
 *  check db to exist author 
 * @param author checking author
 * @returns author id
 */
async function checkExistAuthor(author: string) {
    const author_id = await requestDataBase(sql_req.findAuthor, [author]) as IA_id[];
    if (author_id.length !== 0) {
        return author_id;
    }
    await requestDataBase(sql_req.addAuthor, [author]);
    return await requestDataBase(sql_req.findNewAuthorId, [author]) as IA_id[];
}
/**
 *  processing request, add new book to db and add new author if not exist in db;
 *  join book and authors 
 * @param req request from front
 */
export async function addAndJoinBookAuthor(req: Request) {
    const file = req.file?.originalname;
    const { title, year, pages, author1, author2, author3, desc } = req.body;
    const authorArray: string[] = [author1, author2, author3];
    //check to correct input
    let authorsIsEmpty = true;
    authorArray.forEach(e => {
        if (e !== undefined) {
            authorsIsEmpty = false;
        }
    });
    if (authorsIsEmpty || !title || year.match(/\D/) !== null || pages.match(/\D/) !== null || !desc) {
        return { error: "not right input", title, year, pages, desc, author1, author2, author3 }
    }
    //add book and get book id
    await requestDataBase(sql_req.addBook, [title, `/books-images/${file}`, desc, year, pages]);
    const book_id = await requestDataBase(sql_req.findNewBookId, [title]) as IB_id[];
    //add all author to bd and join to new book
    authorArray.forEach(async author => {
        if (author !== '') {
            const author_id = await checkExistAuthor(author)
            await requestDataBase(sql_req.joinTables, [book_id[0].b_id, author_id[0].a_id]);
        }
    })
    return { ok: true }
}






