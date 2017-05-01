#include <QtCore/QObject>
#include <QtCore/QVariant>

void test()
{
    QObject o;
    o.connect(&o, SIGNAL(destroyed(int, int)), &o, SLOT(void foo(const int)));

    QVariant v, returnedValue;
    QMetaObject::invokeMethod(&o, "mySlot", Q_RETURN_ARG(QVariant , returnedValue), Q_ARG(const QVariant, v));
    QMetaObject::invokeMethod(&o, "mySlot", Q_RETURN_ARG(QVariant , returnedValue),
                              Q_ARG(const QVariant,
                                    v)); // mult-line
}



