#ifndef DIALOG_H
#define DIALOG_H

#include <QDialog>
#include <QVBoxLayout>
#include <QLabel>

class Dialog: public QDialog {
    public:
        Dialog(QWidget *parent = nullptr);

    public slots:
        void submit_content();
        void layers_handler();

    private:
        QVBoxLayout *layout;
        QPushButton *submit;
        QPushButton *layers_btn;
        QLineEdit *xedit;
        QLineEdit *yedit;
};

#endif // DIALOG_H
