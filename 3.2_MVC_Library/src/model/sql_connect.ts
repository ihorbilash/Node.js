import { createPool } from 'mysql2';
import * as dotenv from 'dotenv';
dotenv.config({ path: '.env' });

const { HOST, BD_USERNAME, PASSWORD, DATABASE, BD_PORT } = process.env;

export const pool = createPool({
    host: HOST, 
    user: BD_USERNAME,
    password: PASSWORD, 
    database: DATABASE, 
    multipleStatements: true
})

