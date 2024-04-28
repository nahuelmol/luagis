#ifndef DIALOG_H
#define DIALOG_H

#include <QDialog>
#include <QVBoxLayout>
#include <QLabel>

class Dialog: public QDialog {
    public:
        Dialog(QWidget *parent = nullptr);

    public slots:
        void example();
        void submit_content();


    private:
        QVBoxLayout *layout;
        QLabel *label;
        QPushButton *button;
        QPushButton *submit;
        QLineEdit *edit;
};

#endif // DIALOG_H
