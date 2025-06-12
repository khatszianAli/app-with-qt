#include <QApplication>
#include <QWidget>
#include <QPushButton>
#include <Qpainter>
#include <QHBoxLayout>

class QPaintWindow: public QWidget {
public:
    enum Shape{
        Circle,
        Rectangle,
        App
    };
    void setShape(Shape form){
        this->shape = form;
    };
    QPaintWindow(){
        this -> setWindowTitle("App");
        this -> resize(500, 500);

        shape = App;
        canvas = new QWidget(this);
        canvas -> setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
        auto *controlPanel = new QWidget(this);
        auto *circleButton = new QPushButton("Circle", controlPanel);
        auto *rectangleButton = new QPushButton("Rectangle", controlPanel);

        QObject::connect(circleButton, &QPushButton::clicked, canvas, [this](){
            this -> setShape(Circle);
        });
        QObject::connect(rectangleButton, &QPushButton::clicked, canvas, [this](){
            this -> setShape(Rectangle);
        });

        auto *buttonLayout = new QHBoxLayout(controlPanel);
        buttonLayout ->addWidget(rectangleButton);
        buttonLayout ->addWidget(circleButton);
        controlPanel ->setLayout(buttonLayout);

        auto windowLayout = new QVBoxLayout(this);
        windowLayout -> addWidget(canvas);
        windowLayout -> addWidget(controlPanel);

        this-> setLayout(windowLayout);
    }
protected:
    void paintEvent(QPaintEvent* ) override{
        QPainter painter;
        painter.begin(this);

        int gap = canvas -> width()/(canvas->width()/10);
        if(shape==Circle){
            painter.setBrush(QColor(255, 0, 0));
            painter.drawEllipse(gap, gap, canvas->width(), canvas->height());
        }
        if(shape==Rectangle){
            painter.setBrush(QColor(0, 0, 255));
            painter.drawRect(gap, gap, canvas->width(), canvas->height());
        }
        update();
        painter.end();
    }
private:
    int shape;
    QWidget* canvas;
};

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);
    auto window = new QPaintWindow;
    window->show();
    return QApplication::exec();
}