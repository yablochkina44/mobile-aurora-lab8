#ifndef STRINGLIST_H
#define STRINGLIST_H

#include <QObject>
#include <QString>

class StringList : public QObject
{
    Q_OBJECT
public:
    explicit StringList(QObject *parent = nullptr);
    Q_INVOKABLE int add(QString temp) {
        for(int i =0; i<temp.length();i++)
        {temp[i]=temp[i].toUpper();}
        if (m_data.contains(temp)) {
            return 1;
        }

        m_data << temp;
        return 0;
    };
    Q_INVOKABLE void popBack()
    {
        if (!m_data.isEmpty()) {
            m_data.pop_back();
        }
    };

    Q_INVOKABLE QString getAll()
    {
        QString temp;
        for (int i = 0; i < m_data.length(); i++)
        {
            if (i == 0) {
                QString t = m_data[i];
                t[0] = t[0].toUpper();
                temp += t;
            } else {
                temp += m_data[i].toLower();
            }

            if (i != m_data.length()-1){
                temp += ", ";
            }
        }

        return temp;
    };


    /* Q_INVOKABLE QString getAll()
    {
        QString temp;
        for (int i = 0; i < m_data.length(); i++)
        {
            if (i == 0) {
                QString t = m_data[i];
                t[0] = t[0].toUpper();
                temp += t;
            } else {
                temp += m_data[i].toLower();
            }

            if (i != m_data.length()-1){
                temp += ", ";
            }
        }

        return temp;
    };*/
private:
    QList<QString> m_data;
    int j=0;

signals:
    void onInputError();
};

#endif // STRINGLIST_H
