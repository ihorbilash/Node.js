import { Request, Response } from "express"

import UserSchema from '../model/model'


export async function login(req:Request, res:Response) {
    const { login, pass } = req.body
    const user = await UserSchema.findOne({ login, pass })
    if (user) {
        req.session.user_id = user._id
        res.send({ "ok": true })
    } else {
        return res.status(400).json({ error: "not found" })

    }
  }




export async function register(req:Request, res:Response) {

    const { login, pass } = req.body

    let user = await UserSchema.findOne({ login, pass })
   
    if (user) {
        res.status(400).json({ error: "bad request" })
    } else {
        const newUser = new UserSchema({ login: login, pass: pass, items: [] })
        await newUser.save()
        res.json({ "ok": true })
    }
}


export async function logout(req:Request, res:Response) {

    req.session.destroy;
    res.json({ "ok": true })
}

export default { login, logout, register }