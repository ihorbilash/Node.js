
import express from 'express';
import router from './routers/route';
import routerV2 from './routers/routeV2';
import bodyParser from 'body-parser';
import cookieParser from 'cookie-parser';
import * as sessiontoSQL from 'express-session';
import MySQLSession from 'express-mysql-session';
import session from 'express-session';
const MySQLStore = MySQLSession(sessiontoSQL);

const app = express();
const PORT = process.env.PORT || 3005;
app.use(bodyParser.json())
app.use(cookieParser('secret key'))
app.use(express.static('static'));
const sessionStore = new MySQLStore({
    host: "localhost",
    user: "root",
    password: "11111111",
    database: "klizma",
})

app.use(session({
    saveUninitialized: false,
    secret:"sicret",
    resave:false,
    store: sessionStore,
}));

declare module 'express-session'{
    interface SessionData{
        Id:number|undefined;
    }
}

app.use('/api/v1', router)
app.use('/api/v2', routerV2)


app.listen(PORT, () => {
    console.log("Server has been started...");
});






