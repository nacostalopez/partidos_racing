const express = require("express");
const config = require("./config");
const port = process.env.PORT || 4000;
const clientes= require('./modulos/clientes/rutas')

const app= express ();

//configuracion
app.set('port', config.app.port)


//rutas
app.use('/api/clientes', clientes )
module.exports= app;

