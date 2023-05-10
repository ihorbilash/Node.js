import { Request, Response } from "express";
import { requestDataBase, sql_req } from '../model/sql_request'
import { IBook, ICount } from "../interfaces/interfaces"
import paginationPageAndOffset from '../controllers/pagination'
import fs from 'fs'




export async function getBooks(req: Request, res: Response) {
    try {
        if (req.query.search != undefined) {
            await searshBook(req, res);
        } else {
            const books = await requestDataBase(sql_req.countBooks) as ICount[];
            const { pages, startLimit, OFFSET } = paginationPageAndOffset(books[0].count, Number(req.query.page))
            const allBooks = await requestDataBase(sql_req.getPages, [startLimit, OFFSET]);
            res.render('main', { books: allBooks, pages: pages, mainPage: true })
        }
    } catch (e) {
        res.status(500).json(e);
    }
}
export async function searshBook(req: Request, res: Response) {
    const str = req.query.search as string;
    const search: string[] | string | null = str.match(/^[A-Za-zА-Яа-я0-9 ]+$/);
    if (search !== null) {
        const allBook = await requestDataBase(sql_req.searchBook, [`%${search[0]}%`]);
        res.render('main.hbs', { books: allBook })
    }

}

export async function getBook(req: Request, res: Response) {
    try {
        const book_id = req.params.id;
        const book = await requestDataBase(sql_req.getOneBook, [book_id]) as IBook[];
        const click = book[0].count_search + 1;
        await requestDataBase(sql_req.updateBookViews, [click, Number(book_id)]);
        const data = fs.readFileSync('static/books-images/text.txt', 'utf-8');
        res.render('main', { onebook: book[0], text: data });
    } catch (e) {
        res.status(500).json(e);
    }
}

export async function putCount(req: Request, res: Response) {
    try {
        if (req.body.countClick) {
            const book_id = req.params.id;
            let book = await requestDataBase(sql_req.getOneBook, [book_id]) as IBook[];
            let click = book[0].count_click + 1;
            await requestDataBase(sql_req.addingClicks, [click, Number(book_id)]);
        }
    } catch (e) {
        res.status(500).json(e);
    }
}






