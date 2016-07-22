#!groovy
node("slave") {
    def isUnix = isUnix();
    stage "checkout"

    if (env.DISPLAY) {
        println env.DISPLAY;
    } else {
        env.DISPLAY=":1"
    }
    env.RUNNER_ENV="production";

    checkout scm
    if (isUnix) {sh 'git submodule update --init'} else {bat "git submodule update --init"}
    stage "init base"

    //checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'SubmoduleOption', disableSubmodules: false, recursiveSubmodules: true, reference: '', trackingSubmodules: true]], submoduleCfg: [], userRemoteConfigs: [[url: 'http://git.http.service.consul/shenja/vanessa-behavior.git']]])
    echo "${env.WORKSPACE}"

    def srcpath = "./lib/cf/";
    if (env.SRCPATH){
        srcpath = env.SRCPATH;
    }
    def v8version = "";
    if (env.V8VERSION) {
        v8version = "--v8version ${env.V8VERSION}"
    }
    def command = "oscript -encoding=utf-8 tools/init.os init-dev ${v8version} --src "+srcpath
    timestamps {
        if (isUnix){
            sh "${command}"
        } else {
            bat "${command}"
        }
    }

    stage "build"
    echo "build catalogs"
    command = """oscript -encoding=utf-8 tools/runner.os compileepf ${v8version} --ibname /F"./build/ib" ./ ./build/out/ """
    if (isUnix) {sh "${command}"} else {bat "${command}"}       
    
    stage "test"
    command = """oscript tools/runner.os -encoding=utf-8 xunit "./build/out/Tests" ${v8version} --ibname /F"./build/ib" --path ./build/out/xddTestRunner.epf  --report ./build/report.xml"""
    if (isUnix){ sh "${command}" } else {bat "${command}"}
    step([$class: 'JUnitResultArchiver', testResults: '**/build/report.xml'])
}