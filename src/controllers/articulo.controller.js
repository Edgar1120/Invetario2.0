import { getConnection } from "../database/connection";


export const getArticulo = async (req, res) => {

    const pool = await getConnection();
    const result = await pool
        .request()
        .execute('pa_GetArticulos')

    res.json(result.recordset);
    pool.close();

}


export const agregarArticulo = async (req, res) => {

    const pool = await getConnection();

    const result = await pool
        .request()
        .input('pNombre', req.body.pNombre)
        .input('pDescripcion', req.body.pDescripcion)
        .input('pIdCategoria', req.body.pIdCategoria)
        .input('pPrecioCosto', req.body.pPrecioCosto)
        .input('pPrecioPromedio', req.body.pPrecioPromedio)
        .input('pCantidadActual', req.body.pCantidadActual)

        .execute('pa_AgregarArticulo');

    const resultMessage = result.recordset[0].Msg;
    res.json({ message: resultMessage });
    pool.close();

};

export const eliminarArticulo = async (req, res) => {
    const pool = await getConnection();
    try {
        const result = await pool
            .request()
            .input('pIdArticulo', req.params.pIdArticulo)
            .execute('pa_EliminarArticulo');

        const resultMessage = result.recordset[0].Msg;
        res.json({ message: resultMessage });
    } catch (error) {
        res.status(500).json({ message: 'Error al eliminar el artículo.', error: error.message });
    } finally {
        pool.close();
    }
};


export const actualizarArticulo = async (req, res) => {

    const { pIdArticulo } = req.params;
    const pool = await getConnection();
    const { pNombre, pDescripcion, pIdCategoria,
        pPrecioCosto, pPrecioPromedio,
        pCantidadActual } = req.body;

    const result = await pool
        .request()
        .input('pIdArticulo', pIdArticulo)
        .input('pNombre', pNombre)
        .input('pDescripcion', pDescripcion)
        .input('pIdCategoria', pIdCategoria)
        .input('pPrecioCosto', pPrecioCosto)
        .input('pPrecioPromedio', pPrecioPromedio)
        .input('pCantidadActual', pCantidadActual)
        .execute('pa_ActualizarArticulo')

    const resultMessage = result.recordset[0].Msg;
    res.json({ message: resultMessage });



};
