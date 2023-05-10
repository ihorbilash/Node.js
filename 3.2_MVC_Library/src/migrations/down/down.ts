import { pool } from '../../model/sql_connect'
import { readFileSync } from 'fs';

const file = readFileSync(__dirname + "/migration_down.sql", "utf-8");
  
try {
    pool.query(file, err => {
        if (err) {
            console.log("error to drop migration =>", err)
        } else {
            console.log("migration=> dropped")
        }
        pool.end();
    })
} catch (e) {
    console.log("some error to drop migrations=>", e)
}