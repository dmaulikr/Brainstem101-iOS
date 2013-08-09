from os import listdir
         
def generateCodeFor(files, folder_name):
   for f in files:
       print("[self addQuestionWithAnswer:@\"" + answerFromFileName(f) +"\" imageName:@\"" + f + "\" andBackgroundImageName:@\"quiz-background-" + folder_name + ".png\"];")


def answerFromFileName(file_name):
   file_name = file_name.replace(".png", "")
   file_name = file_name.replace("-", " ")
   return file_name.title()


path_to_quiz_folder = "/Users/Cam/Desktop/QUIZ"
folders_to_use = ['0', '1', '2', '3', '4', '5', '6', '7', '8', 'perfusion', 'side']

for folder_name in folders_to_use:
   generateCodeFor(listdir(path_to_quiz_folder + "/" + folder_name), folder_name)
