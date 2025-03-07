local Config = require 'data.config';
Hunting = {};

require 'server.utils.functions';
require 'server.modules.peds.server';

RegisterNetEvent('lm-hunting:server:createAnimal', CreateAnimal)