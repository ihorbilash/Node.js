//observ

import { Request } from "express";

//how many pages we want to show
const OFFSET = 12;
const STEP = 6;

export default function paginationPageAndOffset(countBooks: number, curentPage: number|undefined) {

    let pages = []
    const countOfPages = Math.ceil(countBooks / (OFFSET - STEP));
    if (countOfPages > 0) {
        for (let i = 1; i <= countOfPages; i++) {
            pages.push({ page: i })
        }
    }
    let page = curentPage ? curentPage : 1;
    let startLimit = page === 1 ? 0 : (page - 1) * STEP;
    return { pages, startLimit, OFFSET };
}

