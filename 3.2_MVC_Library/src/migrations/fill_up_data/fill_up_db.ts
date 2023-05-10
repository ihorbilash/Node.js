import { pool } from '../../model/sql_connect'
import { readFileSync } from 'fs';

const file = readFileSync(__dirname + "/test_data.sql", "utf-8");
   
try {
    pool.query(file, err => {
        if (err) {
            console.log("error to filled up =>", err)
        } else {
            console.log("migration=> filled up DB")
        }
        pool.end();
    })
} catch (e) {
    console.log("some error to filled up DB=>", e)
}