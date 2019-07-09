#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QScreen>
#include <QQmlContext>

static void setScreenNativeOrientationInQml(QGuiApplication *app, QQmlApplicationEngine *engine) {
    auto *screen = app->primaryScreen();
    auto nativeOrientation = screen->nativeOrientation();

    auto rootContext = engine->rootContext();
    rootContext->setContextProperty("orientationDemoNativeOrientation", nativeOrientation);
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    setScreenNativeOrientationInQml(&app, &engine);

    engine.load(url);

    return app.exec();
}
