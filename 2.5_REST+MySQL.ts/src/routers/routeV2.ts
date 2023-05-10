import express, { Request, Response } from 'express';

import { gets, create, update, del } from '../controllers/item';
import { login, logout, register } from '../controllers/user';
const router = express.Router();

function choseFunction(nameFunc: string, req:Request, res:Response) {
   
   return nameFunc === "getItems" ? gets(req, res) :
      nameFunc === "register" ? register(req, res) :
         nameFunc === "login" ? login(req, res) :
            nameFunc === "logout" ? logout(req, res) :
               nameFunc === "createItem" ? create(req, res) :
                  nameFunc === "editItem" ? update(req, res) : del(req, res);
}

router.route('/router').all((req, res) => {
   try {
      const nameFunc: string = req.query.action as string;
      choseFunction(nameFunc, req, res);
   } catch (e) {
      console.log("Someting wrong=>>", e)
   }
})

export default router;