import { Router } from "express";
import { actualizarUsuario, agregarUsuario, eliminarUsuario, getUsuario, login, getAuditFecha } from "../controllers/user.controller";
import { actualizarBodega, agregarBodega, eliminarBodega, getBodega } from "../controllers/bodegas.controllers";
import { actualizarArticulo, agregarArticulo, eliminarArticulo, getArticulo } from "../controllers/articulo.controller";
import { actualizarCategoria, agregarCategoria, eliminarCategoria, getCategoria } from "../controllers/categoria.controller";
import { actualizarInventario, agregarInventario, eliminarInventario, getInventario } from "../controllers/inventario.controller";
import { actualizarMovimientoInventario, agregarMovimientoInventario, eliminarMovimientoInventario, getMovimientoInventario } from "../controllers/moviminetoInventario.controller";
import {  getTrazabilidad } from "../controllers/trazabilidad.controller";
 
const router = Router()

//Usuario
router.post("/usuario/agregarUsuario",agregarUsuario);
router.put("/usuario/actualizarUsuario/:pIdUsuario", actualizarUsuario);
router.delete("/usuario/eliminarUsuario/:pIdUsuario", eliminarUsuario);
router.get("/usuario/getUsuario", getUsuario);
router.post("/usuario/login", login);
router.get("/usuario/getAuditFecha",getAuditFecha);

//Bodega
router.get("/bodega/getBodega",getBodega);
router.post("/bodega/agregarBodega",agregarBodega);
router.put("/bodega/actualizarBodega/:pIdBodega",actualizarBodega);
router.delete("/bodega/eliminarBodega/:pIdBodega",eliminarBodega);

//Articulo
router.get("/articulo/getArticulo",getArticulo);
router.post("/articulo/agregarArticulo",agregarArticulo);
router.put("/articulo/actualizarArticulo/:pIdArticulo",actualizarArticulo);
router.delete("/articulo/eliminarArticulo/:pIdArticulo",eliminarArticulo);

//Categoria

router.get("/categoria/getCategoria",getCategoria);
router.post("/categoria/agregarCategoria",agregarCategoria);
router.put("/categoria/actualizarCategoria/:pIdCategoria",actualizarCategoria);
router.delete("/categoria/eliminarCategoria/:pIdCategoria",eliminarCategoria);

//Inventario

router.get("/inventario/getInventario",getInventario);
router.post("/inventario/agregarInventario",agregarInventario);
router.put("/inventario/actualizarInventario/:pIdInventario",actualizarInventario);
router.delete("/inventario/eliminarInventario/:pIdInventario",eliminarInventario);



//Movimiento de inventario

router.get("/movimientoInventario/getMovimientoInventario",getMovimientoInventario);
router.post("/movimientoInventario/agregarMovimientoInventario",agregarMovimientoInventario);
router.put("/movimientoInventario/actualizarMovimientoInventario/:pIdMovimiento",actualizarMovimientoInventario);
router.delete("/movimientoInventario/eliminarMovimientoInventario/:pIdMovimiento",eliminarMovimientoInventario);

//Trazabilidad
router.get("/trazabiliad/getTrazabildiad/:pIdArticulo",getTrazabilidad);


export default router