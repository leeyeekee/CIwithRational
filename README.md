# CIwithRational
This is a CI prototype with Rational CLM, Jenkins, Maven and Nexus deploying to Tomcat

The environment for this is based on Windows but can always be replicated with minor changes to Linux.

Pre-requisite:
1.  Download the installation Manager @ https://jazz.net/downloads/ibm-installation-manager/releases/1.8.4, follow the instruction to install the Installation Manager. 
2.  Download Rational CLM from https://jazz.net/downloads/clm/releases/6.0.2?p=allDownloads. You will need to create an account with the website first. Launch the Installation Manager to install the Rational CLM server.
3.  Download the Rational Team Concert client @ https://jazz.net/downloads/rational-team-concert/releases/6.0.2/RTC-Client-Eclipse4.2-repo-6.0.2.zip or Rational Team Concert client plugin for Eclipse @ https://jazz.net/downloads/rational-team-concert/releases/6.0.2/RTC-Client-p2Repo-6.0.2.zip. The later option allows one to extend the existing Eclipse client installation with Rational Team Concert option.
4.  Follow the instruction to install the Rational Team Concert client tool. 
5.  Download the SCM client tool @ https://jazz.net/downloads/rational-team-concert/releases/6.0.2/RTC-scmTools-Win64-6.0.2.zip and follow instruction to install it. Refer to for the help to the scm command line reference : https://jazz.net/library/article/620.
6.  Install Nexus Repository Manager OSS 2.13.0-01 from https://books.sonatype.com/nexus-book/reference/downloading.html and follow instruction to install it. Create a local repository called MyRepo1.
7.  Install Jenkins 2.7.x from https://jenkins.io/ and follow the instruction to install it. Install the Build Pipeline Plugin. Start Jenkins using this command line : java -Dhudson.util.ProcessTree.disable=true -jar jenkins.war
8.  Install wget from https://eternallybored.org/misc/wget/ and follow instructin to install it.
9.  Create a demo project using the Agile scrum template in CLM, called in Demo.
10.  Copy the sample.war in the tomcat webapps folders (shutdown the tomcat server if it is started), restart tomcat and validate that the sample applicaation is ok @ http://<server>:<port>/Sample/index.jsp.
11.  Launch Eclipse and load the demo project. Once load, check in CLM Demo project and create a baseline 1.0 at the the Demo Default Component under the Demo Default Stream.

Notes : The script is using the following credentials:
clm id/pwd : clmadmin/passw0rd
nexus id/pwd : admin/admin123
jenkins id/pwd : admin/passw0rd

The sandboxes folders are in d:\test and d:\test2, you may need to change the scripts to refer to the correct path of your installation and sandbox.

Read the powerpoint BTPN CI Walkthrough slide to understand the flow.

Demo steps:
1. Open Eclipse, connect to CLM 
2. Make change to App3.jave
3. Checkin and Deliver. Associate the change with the workitem in RTC
4. Create baseline called 1.1
5. Launch the Jenkins @ http://:server>:<port>/. Configure the job and Build Pipeline as per the powerpoint
6. Click on Run on the Build Pipeline with the parameter such as baseline1 and baseline2 and version
7. Once done, click on Deploy to Repo to deploy to tomcat.
8. See the changes taking effect in Sample application.
