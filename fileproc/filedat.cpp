#include <fstream>
#include <sstream>
#include <string>
#include <algorithm>

void defineSeparation(){
    //type ";", ",", <tab>, <space>
}

std::string clean_separation(std::string& content){
    bool train_spaces = false;
    int N = content.length();
    int spaces = 0;
    int lines = 0;
    for(int i=0;i<N;i++){
        if(content[i] == ' '){
            spaces = spaces + 1;
            if(!train_spaces){
                content[i] = ';';
                train_spaces = true;
            }
        } else {
            train_spaces = false;
        }
    }
    char space = ' ';
    content.erase(std::remove(content.begin(), content.end(), space), content.end());
    std::cout << "more new content:" << content << std::endl;
    return content;
}

std::string readasString(const std::string& filepath){
    std::ifstream file(filepath);
    if (!file.is_open()) {
        throw std::runtime_error("Could not open file: " + filepath);
    }

    std::stringstream buffer;
    buffer << file.rdbuf(); // Read the file into the buffer

    std::string buffer_string = buffer.str();
    std::string cleaned_string = clean_separation(buffer_string); //conver buffer to a string
    return cleaned_string;
}
