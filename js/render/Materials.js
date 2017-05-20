function Materials() {

}

Materials.createMetal = function () {
    return new Material(
            0.1,
            1.0,
            0.7,
            1.0,
            1.0,
            20.0,
            [arguments[0],arguments[1],arguments[2]],
            [arguments[0],arguments[1],arguments[2]],
            [arguments[0],arguments[1],arguments[2]]
            );
}

Materials.createPolishedMetal = function () {
    return new Material(
            0.0,
            0.0,
            0.0,
            1.0,
            1.0,
            20.0,
            [arguments[0],arguments[1],arguments[2]],
            [arguments[0],arguments[1],arguments[2]],
            [arguments[0],arguments[1],arguments[2]]
            );
}

Materials.createPlastic = function () {
    return new Material(
            0.1,
            1.0,
            1.0,
            1.0,
            0.0,
            10.0,
            [arguments[0],arguments[1],arguments[2]],
            [1, 1, 1],
            [0, 0, 0]
            );
}

Materials.createMatte = function () {
    //console
    return new Material(
            0.1,
            1.0,
            1.0,
            0.0,
            0.0,
            0.0,
            [arguments[0],arguments[1],arguments[2]],
            [0, 0, 0],
            [0, 0, 0]
            );
}
Materials.RED_PLASTIC = Materials.createPlastic(1, 0, 0);
Materials.YELLOW_PLASTIC = Materials.createPlastic(1, 1, 0);

Materials.BLUE_MATTE = Materials.createMatte(0, 0, 1);
Materials.GREEN_MATTE = Materials.createMatte(0, 1, 0);
Materials.YELLOW_MATTE = Materials.createMatte(1, 1, 0);
Materials.WHITE_MATTE = Materials.createMatte(1, 1, 1);

Materials.YELLOW_METAL = Materials.createMetal(1, 1, 0);
Materials.PURPLE_METAL = Materials.createMetal(1, 0, 1);
Materials.BLUE_METAL = Materials.createMetal(0, 0, 1);
Materials.CYAN_METAL = Materials.createMetal(0, 1, 1);
Materials.RED_METAL = Materials.createMetal(1, 0, 0);

Materials.MIRROR = Materials.createPolishedMetal(1, 1, 1);
