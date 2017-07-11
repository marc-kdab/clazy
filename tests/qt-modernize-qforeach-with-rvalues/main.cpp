#include <QtCore/QVector>

QStringList makeList() { return {}; }
void consume(const QString &);

void positive1()
{
    Q_FOREACH(const QString &string, makeList())
        consume(string);
}

void negative1()
{
    const auto strings = makeList();
    Q_FOREACH(const QString &string, strings)
        consume(string);
}
