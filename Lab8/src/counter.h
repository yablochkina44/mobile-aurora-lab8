#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>
#include <QString>

class Counter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int count READ getCount WRITE setCount NOTIFY countChanged)
public:
    explicit Counter(QObject *parent = NULL);
    Q_INVOKABLE int getCount() { return m_count; };
    Q_INVOKABLE void increment() { m_count++; };
    Q_INVOKABLE void reset() { m_count = 0; };

    void setCount(const int temp) { m_count = temp; emit countChanged(); };

signals:
    void countChanged();


private:
    int m_count = 0;
};

#endif // COUNTER_H
