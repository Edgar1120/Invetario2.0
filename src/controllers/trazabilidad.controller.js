import { getConnection } from "../database/connection";

export const getTrazabilidad = async (req, res) => {
    
        const pool = await getConnection();
        const result = await pool
            .request()
            .input('IdArticulo', req.params.pIdArticulo)  
            .execute('pa_GetTrazabilidad');
            
            res.json(result.recordset);
            pool.close();
        
};