import express from 'express';
import bodyParser from 'body-parser';
import mongoose from 'mongoose';
import session from 'express-session';
import router from './routers/route';
import routerV2 from './routers/routerV2';
import cors from 'cors'


//const FileStore = require('session-file-store')(session)
import connectionMongo from 'connect-mongodb-session'
const MongoStore = connectionMongo(session);
const URL = 'mongodb+srv://at_user:users@cluster0.mitc6.mongodb.net/myFirstDatabase'

const app = express();
const PORT = process.env.PORT || 3005;

app.use(bodyParser.json())
app.use(express.static('static')); // if using cors this string be redundant

/*app.use(cors({
    origin: ["http://localhost:8080"],
    methods: ["GET", "POST", "PUT", "DELETE"],
    credentials: true
}));*/

app.use(session({
    store: new MongoStore({
        databaseName: 'connect_mongodb_session',
        collection: 'sessions',
        uri: URL,

    }),
    secret: 'keyboard cat',
    resave: true,
    saveUninitialized: true,
}));

declare module 'express-session' {
    interface SessionData {
        user_id: string
    }
}

mongoose.connect(URL).then(() =>
    console.log('Connection to BD mongoose'))
    .catch(err => console.log(err));


app.use('/api/v1', router);
app.use('/api/v2', routerV2);



app.listen(PORT, () => {
    console.log(`Server has been started port=>${PORT}`)
});