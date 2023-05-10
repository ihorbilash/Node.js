import { Request, Response } from "express";

import { checkLogin, addUser } from '../model/sqlModel'


export async function login(req:Request, res:Response) {
    const { login, pass } = req.body
    const id = await checkLogin({ login, pass });
    if (id) {
        req.session.Id = id;
        res.send({ "ok": true })
    } else {
        return res.status(400).json({ error: "not found" })
    }
}

export async function logout(req:Request, res:Response) {
    req.session.destroy;
    res.json({ "ok": true })
}


export async function register(req:Request, res:Response) {
    const { login, pass } = req.body
    const id = await checkLogin({ login, pass })
    if (id) {
        res.status(400).json({ error: "bad request" })
    } else {
        await addUser({ login, pass })
        res.json({ "ok": true })
    }

}

