//employee.api.js
import {rootApi} from "../apis/root.api.js"

export const productAllGetApi = async () => {
    try {
        const response = await rootApi.get("/products") // DB에서 가져오기 떄문에 employee가 아닌 DB에서 정의한 employees임
        return response.data
    } catch (error) {
        return error
    }
}

export const productGetApi = async (id) => {
    try {
        const response = await rootApi.get(`/products/${id}`)
        return response.data
    } catch (error) {
        return error
    }
}

export const productPostApi = async (dataObj) => {
    try {
        const response = await rootApi.post("/products", dataObj)
        return response.data
    } catch (error) {
        return error
    }
}

export const productPutApi = async (dataObj) => {
    try {
        const response = await rootApi.put(`/products/${dataObj.id}`, dataObj)
        return response.data
    } catch (error) {
        return error
    }
}

export const productDeleteApi = async (id) => {
    try {
        await rootApi.delete(`/products/${id}`)
        return id
    } catch (error) {
        return error
    }
}