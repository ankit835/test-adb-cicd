
pipeline {
agent { dockerfile true }
    environment{ 
            DATABRICKS_TOKEN_MAIN= credentials('adb-token2')
      		DATABRICKS_HOST_MAIN= credentials('host-url')
            }
    
    stages { 
        stage('deploy') {
           when { branch 'test' }

            steps {  

                    // sh '''
                        
                    //     echo "${DATABRICKS_HOST_MAIN}\n${DATABRICKS_TOKEN_MAIN} | databricks configure --token"
                        
                    // ''' 
                script {
                    sh "echo '${DATABRICKS_HOST_MAIN}\n${DATABRICKS_TOKEN_MAIN}' | databricks configure --token"
                }

                

                // DDL deployment
                     sh '''
                         DDL_FOLDER=/Workspace/Shared/DDL
                         echo $DDL_FOLDER
                         databricks workspace import_dir DDL $DDL_FOLDER --exclude-hidden-files --overwrite
                     '''
                // // DML deployment
                //     sh '''
                //         DML_FOLDER=/Workspace/Users/
                //         echo $DML_FOLDER
                //         databricks workspace import_dir Demo_DML $DML_FOLDER --exclude-hidden-files --overwrite
                //     '''
            }
        }
    }
}
