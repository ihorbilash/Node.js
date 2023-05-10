import express from 'express';
import bodyParser from 'body-parser';
import basicAuth from 'express-basic-auth';
import { engine } from 'express-handlebars';
import router from './router/route';
import dotenv from 'dotenv';
import {startCron} from './model/cron-shedule'
dotenv.config({path:'.env'});


startCron();
const app = express();

app.engine('hbs', engine({
    defaultLayout:false,
    extname:"hbs"
}));

app.set('view engine', 'hbs');
app.set('views', 'views');

app.use(bodyParser.json())
app.use(express.static('static'));


app.use('/admin', basicAuth({
    users: { admin: 'supersecret123', admin1: '111' },
    challenge: true // <--- needed to actually show the login dialog!
}));

app.use(router)

app.listen(process.env.PORT, () => {
    console.log("Server has been started...");
});






