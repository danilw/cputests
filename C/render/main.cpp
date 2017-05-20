
#include "Main_c.cpp"

const Material Materials::RED_PLASTIC = createPlastic(new double[3] {
    1, 0, 0
});
const Material Materials::YELLOW_PLASTIC = createPlastic(new double[3] {
    1, 1, 0
});

const Material Materials::BLUE_MATTE = createMatte(new double[3] {
    0, 0, 1
});
const Material Materials::GREEN_MATTE = createMatte(new double[3] {
    0, 1, 0
});
const Material Materials::YELLOW_MATTE = createMatte(new double[3] {
    1, 1, 0
});
const Material Materials::WHITE_MATTE = createMatte(new double[3] {
    1, 1, 1
});

const Material Materials::YELLOW_METAL = createMetal(new double[3] {
    1, 1, 0
});
const Material Materials::PURPLE_METAL = createMetal(new double[3] {
    1, 0, 1
});
const Material Materials::BLUE_METAL = createMetal(new double[3] {
    0, 0, 1
});
const Material Materials::CYAN_METAL = createMetal(new double[3] {
    0, 1, 1
});
const Material Materials::RED_METAL = createMetal(new double[3] {
    1, 0, 0
});

const Material Materials::MIRROR = createPolishedMetal(new double[3] {
    1, 1, 1
});

const double Vec::TINY = 1e-9;

bool painted = false;
GtkWidget *mainwin;

static Main *c_main;


static void draw_gtk(GtkWidget*, GdkEventExpose*, gpointer);

void launch() {

    gtk_init(NULL, NULL);
    GtkWidget *canvas = NULL;

    mainwin = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    canvas = gtk_drawing_area_new();
    gtk_widget_set_size_request(canvas, c_main->WIDTH, c_main->HEIGHT);

    gtk_container_add(GTK_CONTAINER(mainwin), canvas);

    g_signal_connect(mainwin, "destroy", G_CALLBACK(gtk_main_quit), NULL);

    g_signal_connect(G_OBJECT(canvas), "expose-event",
            G_CALLBACK(draw_gtk), NULL);

    gtk_widget_show_all(mainwin);
    gtk_main();

}

static void draw_gtk(GtkWidget *widget, GdkEventExpose *eev, gpointer data) {
    if (!painted) {
        painted = true;
        c_main->image = gdk_cairo_create(widget->window);
        c_main->render();
        cairo_destroy(c_main->image);
    }
}

int main(int argc, char** argv) {

    srand(time(NULL));
    c_main = new Main();
    launch();
    return 0;
}
