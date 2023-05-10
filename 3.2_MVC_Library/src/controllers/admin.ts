import { Request, Response } from "express";
import { requestDataBase, addAndJoinBookAuthor, sql_req } from '../model/sql_request'
import { ICount } from "../interfaces/interfaces"
import paginationPageAndOffset from '../controllers/pagination'



export async function getAdmPage(req: Request, res: Response) {
    try {
        const books = await requestDataBase(sql_req.countBooks) as ICount[];
        const { pages, startLimit, OFFSET } = paginationPageAndOffset(books[0].count, Number(req.query.page));
        const allBooks = await requestDataBase(sql_req.getPages, [startLimit, OFFSET]);
        const allAuthors = await requestDataBase(sql_req.getAllAuthors);
        res.render('main', { admin: allBooks, pages: pages, authors: allAuthors,adminPage:true })
    } catch (e) {
        res.status(500).json(e);
    }

}

export async function create(req: Request, res: Response) {
    try {
        const info = await addAndJoinBookAuthor(req);
        info.ok ? res.redirect('/admin') : res.render('main', { error: info });
    } catch (e) {
        res.status(500).json(e);
    }
}

export async function del(req: Request, res: Response) {
    try {
        await requestDataBase(sql_req.markDeletedBook, [req.body.book_id]);
        await requestDataBase(sql_req.markDeleteJoinAuthorBook, [req.body.book_id]);
        res.json({ "ok": true })
    } catch (e) {
        res.status(500).json(e);
    }
}

export async function update(req: Request, res: Response) {
    try {
        const { title, year, b_id } = req.body;
        await requestDataBase(sql_req.editBook, [title, year, b_id]);
        res.json({ "ok": true })
    } catch (e) {
        res.status(500).json(e);
    }
}