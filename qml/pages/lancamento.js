.pragma library

function toRadian(a) {
    return a * 2 * Math.PI / 360;
}

function calcAlcanceMaximo(v, a, g, h) {
    var w1 = 2 * g * h;
    var w2 = Math.pow(v, 2) * Math.sin(Math.pow(a, 2));
    var w3 = Math.sqrt(1 + (w1 / w2));
    var w4 = Math.pow(v , 2) / (2.0 * g); // Acho q o erro ta aqui
    var w5 = Math.sin(a * 2);

    return (1 + w3) * (w4) * w5;
}

function calcAltitudeMaxima(v, a, g, h) {
    var w1 = v * Math.sin(a);
    var w2 = Math.pow(w1, 2);
    var w3 = 2 * g;

    return h + w2 / w3;
}

function calcTempoVoo(v, a, g, h) {
    var w1 = v * Math.sin(a);
    var w2 = Math.pow(v * Math.sin(a), 2);
    var w3 = 2 * g * h;

    return (w1 + Math.sqrt(w2 + w3)) / g;
}

function calcComponenteHorizontal(v, a) {
    return v * Math.cos(a);
}

function calcComponenteVertical(v, a) {
    return v * Math.sin(a);
}

