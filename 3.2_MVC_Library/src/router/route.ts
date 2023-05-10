import {Router} from 'express'
import multer from 'multer'

import { getBooks,getBook,putCount, } from '../controllers/books'
import { getAdmPage, create, update, del } from '../controllers/admin'
const router = Router();

const multerConf = {
    storage: multer.diskStorage({
        destination:function(req,file,next){
            next(null,'./static/books-images/')
        },
        filename:function(req,file,next){
            next(null,file.originalname); 
        }
    })
}

router.route('/admin')
.get(getAdmPage)
.post(multer(multerConf).single('image'),create)
.delete(del)
.put(update);


router.route('/')
.get(getBooks);

router.route('/book/:id')
.get(getBook)
.post(putCount);


export default router;