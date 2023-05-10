import mysqldump from 'mysqldump';
import dotenv from 'dotenv';
dotenv.config({path:'.env'});

const { HOST, BD_USERNAME, PASSWORD, DATABASE, BD_PORT } = process.env;
export async function mySqlDump(){
    await mysqldump({
        connection:{
            host: HOST,
            user: BD_USERNAME||"",
            password: PASSWORD||"",
            database: DATABASE||"",
        },
        dumpToFile:`src/migrations/backup/backup.sql`,
    });
}

