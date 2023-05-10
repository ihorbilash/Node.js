import cron from 'node-cron';
import { mySqlDump } from './sql_dump';
import { requestDataBase, sql_req } from './sql_request';

export function startCron(){
    cron.schedule('10 * * * * *',async()=>{
        await requestDataBase(sql_req.deleteJoinAuthorBook);
        await requestDataBase(sql_req.deleteBook);
        await mySqlDump();
        console.log("sql backup ok")
    });
 }
