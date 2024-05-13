#ifndef DIALOG_H
#define DIALOG_H

#include <QDialog>
#include <QVBoxLayout>
#include <QLabel>
#include <QComboBox>

class Dialog: public QDialog {
    public:
        Dialog(QWidget *parent = nullptr);

    public slots:
        void submit_content();
        void layers_handler();
        void add_sev();
        void sev_checker();

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

        //db
        QLabel *dbsevs_label;
        QLabel *current_sev;
        QPushButton *checksev;

        QComboBox *combobox;
};

#endif // DIALOG_H
