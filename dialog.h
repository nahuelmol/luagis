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
        void add_sev();

    private:
        QgsVectorLayer *currentVectorLayer;
        QVBoxLayout *layout;
        QPushButton *submit;
        QPushButton *layers_btn;
        QLineEdit *xedit;
        QLineEdit *yedit;

        QLabel      *sev_label;
        QLineEdit   *sev_edit;
        QPushButton *addsev;

        //statics
        QLabel *layers_label;
        QLabel *points_label;
};

#endif // DIALOG_H
