import { Router } from "express";

import {gets,create,update,del} from "../controllers/item";
import { login, logout, register } from "../controllers/user";
const router = Router();




router.post('/login',  login)
router.post('/register', register)
router.post('/logout', logout)

router.route('/items')
.get(gets)
.post(create)
.put(update)
.delete(del)


export default router