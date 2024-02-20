#!groovy
import groovy.json.JsonSlurperClassic
node {
    def BUILD_NUMBER = env.BUILD_NUMBER
    def RUN_ARTIFACT_DIR = "tests/${BUILD_NUMBER}"
    def SFDC_USERNAME
    def TEST_LEVEL='RunLocalTests'
    def HUB_ORG = 'anil123@abc.com'
    def SFDC_HOST = env.SFDC_HOST_DH
    def JWT_KEY_CRED_ID = env.JWT_CRED_ID_DH
    def CONNECTED_APP_CONSUMER_KEY = '3MVG9fe4g9fhX0E6_qsftmS4ix6FfDqQaBlVphLgew9ARU1rKODP0pnoVyyiPVduozeoABhwJ9egoVc1kp9TL'
    println 'KEY IS' 
    println JWT_KEY_CRED_ID
    println HUB_ORG
    println SFDC_HOST
    println CONNECTED_APP_CONSUMER_KEY
    def toolbelt = tool 'toolbelt'
    stage('checkout source') {
        //When running in multi-branch job, one must issue this command
        checkout scm
    }
    withCredentials([file(credentialsId: JWT_KEY_CRED_ID, variable: 'jwt_key_file')]) {
        stage('Authorize to Dev Org') {
            if (isUnix()) {
                rc = sh returnStatus: true, script: "${toolbelt}/sfdx force:auth:jwt:grant --client-id ${CONNECTED_APP_CONSUMER_KEY} --username ${HUB_ORG} --jwt-key-file ${jwt_key_file} --set-default-dev-hub --instance-url ${SFDC_HOST}"
            } else {
                rc = bat returnStatus: true, script: "\"${toolbelt}/sfdx\" force:auth:jwt:grant --client-id ${CONNECTED_APP_CONSUMER_KEY} --username ${HUB_ORG} --jwt-key-file \"${jwt_key_file}\" --set-default-dev-hub --instance-url ${SFDC_HOST}"
            }
            if (rc != 0) { error 'hub org authorization failed' }
        }
       /*stage('Check Apex Test Coverage') {
            if (isUnix()) {
                rmsg = sh returnStdout: true, script: "${toolbelt}/sfdx force:source:deploy:report -u ${HUB_ORG} --test-level ${TEST_LEVEL} --code-coverage"
            } else {
                rmsg = bat returnStdout: true, script: "\"${toolbelt}/sfdx\" force:source:deploy:report -u ${HUB_ORG} --test-level ${TEST_LEVEL} --code-coverage"
            }
            def jsonSlurper = new JsonSlurperClassic()
            def report = jsonSlurper.parseText(rmsg)
 
            if (report.status == 'Succeeded') {
                if (report.result.totalCoverage < 75) {
                    error "Code coverage (${report.result.totalCoverage}%) does not meet the minimum requirement (75%)."
                }
            } else {
                error 'Failed to retrieve code coverage report.'
            }
        }*/
        stage('Deploy Code') {
            // need to pull out assigned username
 
            if (isUnix()) {
                rmsg = sh returnStdout: true, script: "${toolbelt}/sfdx force:source:deploy --manifest manifest/package.xml -u ${HUB_ORG}"
            } else {
                rmsg = bat returnStdout: true, script: "\"${toolbelt}/sfdx\" force:source:deploy --manifest manifest/package.xml -u ${HUB_ORG}"
            }			  
       printf rmsg
            println('Hello from a Job DSL script!')
            println(rmsg)
        }
    }
}
