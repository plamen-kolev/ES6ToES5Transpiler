require 'fileutils'
extentionPattern = '*.js'
Dir.glob('src/**/*.js').select{ |e| 
    outputDirArr = e.split(/\//)
    outputDirArr[0] = 'out'
    outputFile = outputDirArr.join('/')
    outputDirectory = (outputDirArr.first outputDirArr.size - 1).join('/')

    # puts e
    # puts outputFile
    # puts outputDirectory
    
    FileUtils.rm_rf('out')
    FileUtils.mkdir_p outputDirectory
    command = "npx babel #{e} --out-file #{outputDirectory}/#{e.split(/\//).pop}"
    exec(command);

}