require 'data.config';

function ProgressCircle(data, cb)

    --- !!! CHANGE PROGRESS CIRCLE cb(true) TO have success and cb(false) to fail !!!

    if lib.progressBar(data) then cb(true) else cb(false) end
end