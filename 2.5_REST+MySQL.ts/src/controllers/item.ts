
import { Request, Response } from 'express';
import { getItems, addItem, editItem, delItem } from '../model/sqlModel';


export async function gets(req:Request, res:Response) {

    try {
        if (!req.session.Id) {
            res.status(400).json({ error: "forbidden" })
        } else {
            const id = req.session.Id;
            const user = await getItems(id)

            res.json({ items: user })
        }

    } catch (e) {
        res.status(500).json(e);
    }
}

export async function create(req:Request, res:Response) {

    try {
        const { text } = req.body
        const id = req.session.Id
        let item_id = await addItem(id, text)
        res.json({ id: item_id });
    } catch (e) {
        res.status(500).json(e);
    }

}

export async function update(req:Request, res:Response) {
    try {

        const user_id = req.session.Id
        const { text, checked, id } = req.body;
        editItem({ text, checked, id }, user_id)
        res.json({ "ok": true })
    } catch (e) {
        res.status(500).json(e);
    }
}

export async function del(req:Request, res:Response) {
    try {
        const { id } = req.body
        await delItem(id)
        res.json({ "ok": true })


    } catch (e) {
        res.status(500).json(e);
    }
}

