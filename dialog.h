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
        void comboTaker(const QString &text);
        void delpo();
        void editCell(int row, int col);
        void editItem(QTableWidgetItem *item);
        void openFile();
        void to_sev();

    private:
        QTableWidgetItem *targetItem;
        QgsVectorLayer *currentVectorLayer;
        QGridLayout *layout;
        QPushButton *delpoint;
        QPushButton *submit;
        QPushButton *layers_btn;
        QPushButton *toSevBtn;
        QLineEdit *xedit;
        QLineEdit *yedit;

        QLabel      *sev_label;
        QLineEdit   *sev_edit;
        QPushButton *addsev;

        //statics
        QLabel *points_label;

        //db
        QLabel *dbsevs_label;
        QLabel *current_sev;
        QPushButton *checksev;
        //QPushButton *editcellbtn;

        QComboBox *combobox;
        QComboBox *layer_cbox;

        QTableWidget *table;
        QTableWidget *displayTable;

        //openfile
        QPushButton *openFileBtn;
};

#endif // DIALOG_H
