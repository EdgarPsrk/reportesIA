fuzzyclear a;
a = arduino();

light_sensor = 'A0';
temp_sensor = 'A1';
blinds = servo(a, 'D3');
fan = 'D5';
temp = 'D6';

while 1
    volt_light = readVoltage(a, light_sensor);
    volt_temp = readVoltage(a, temp_sensor);

    fis = readfis('fuzzy_controler.fis');

    x = evalfis(fis, [volt_ligth volt_temp]);
    
    writePosition(blinds, x(1,1));
    writePWMDutyCycle(a, fan, x(2,1));
    writePWMVoltage(a, temp, x(3,1));
end