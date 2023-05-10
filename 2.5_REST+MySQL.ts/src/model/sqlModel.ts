import { RowDataPacket } from "mysql2";

import pool from '../dbService'




export async function checkLogin(data: { login: string, pass: string }) {

    const id: number = await new Promise((resolve, reject) => {
        pool.getConnection((err, connection) => {
            const query = `SELECT id FROM user WHERE login='${data.login}' AND pass='${data.pass}'`;
            if (err) { console.log(err) }
            connection.query(query, function (err, results: RowDataPacket) {
                const id = results.length < 1 ? undefined : results[0].id;
                err ? reject(err) : resolve(id);
                connection.release();
            })
        })
    });
    return id;
}
export async function getItems(id: number) {
    return new Promise((resolve, reject) => {
        pool.getConnection((err: Error, connection) => {
            const query = `SELECT * FROM items WHERE items_id='${id}'`;
            connection.query(query, function (err: Error, results: RowDataPacket) {
                const item = results.map((item: { id: Number, text: string, checked: number }) => {
                    const container = {
                        id: item.id,
                        text: item.text,
                        checked: item.checked === 0 ? false : true,
                    };

                    return container;
                })
                err ? reject(err) : resolve(item)
                connection.release();
            })
        })
    });

}

export function addUser(data: { login: string, pass: string }) {
    const { login, pass } = data;
    return new Promise((resolve, reject) => {
        pool.getConnection((err: Error, connection) => {
            const query = `INSERT INTO user (login,pass) values ('${login}','${pass}')`
            connection.query(query, (err: Error, results) => {
                err ? reject(err) : resolve(results)
                connection.release();
            })
        })
    })
}
export async function addItem(id: number | undefined, text: string) {
    let iD: any = await new Promise((resolve, reject) => {
        pool.getConnection((err: Error, connection) => {
            const query = `INSERT INTO items (text,items_id,checked) values ('${text}',${id},${0});`
            connection.query(query, (err: Error, results) => {
                err ? reject(err) : resolve(results)
                connection.release();
            })
        })
    });
    return iD.insertId;
}

export function editItem(data: { text: string, checked: boolean, id: number }, user_id: number | undefined) {
    let { text, checked, id } = data;
    return new Promise((resolve, reject) => {
        pool.getConnection((err: Error, connection) => {
            const query = `UPDATE items SET text='${text}', checked=${checked}  WHERE id = ${id} AND items_id = ${user_id};`
            connection.query(query, (err: Error, results) => {
                err ? reject(err) : resolve(results)
                connection.release();
            })
        })
    })
}
export function delItem(id: number) {
    return new Promise((resolve, reject) => {
        pool.getConnection((err: Error, connection) => {
            const query = `DELETE FROM items WHERE id = ${id};`
            connection.query(query, (err: Error, results) => {
                err ? reject(err) : resolve(results)
                connection.release();
            })
        })
    })
}






