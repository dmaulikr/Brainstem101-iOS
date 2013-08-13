from os import listdir

def generateCodeFor(files, folder_name):
    for f in files:
        if "QUIZ BACKGROUND" not in answerFromFileName(f):
            print("[self addQuestionWithAnswer:@\"" + answerFromFileName(f) +"\" imageName:@\"" + f + "\" andBackgroundImageName:@\"quiz-background-" + folder_name + ".png\"];")


def answerFromFileName(file_name):
    file_name = file_name.replace(".png", "")
    file_name = file_name.replace("-0", "")
    file_name = file_name.replace("-1", "")
    file_name = file_name.replace("-2", "")
    file_name = file_name.replace("-3", "")
    file_name = file_name.replace("-4", "")
    file_name = file_name.replace("-5", "")
    file_name = file_name.replace("-6", "")
    file_name = file_name.replace("-7", "")
    file_name = file_name.replace("-8", "")
    file_name = file_name.replace("-perfusion", "")
    file_name = file_name.replace("-side", "")
    file_name = file_name.replace("-", " ")
    return file_name.upper()


path_to_quiz_folder = "/Users/Cam/Code/Brainstem101/Brainstem101-iOS/Images/Quiz"
folders_to_use = ['0', '1', '2', '3', '4', '5', '6', '7', '8', 'perfusion', 'side']

for folder_name in folders_to_use:
    generateCodeFor(listdir(path_to_quiz_folder + "/" + folder_name), folder_name)

