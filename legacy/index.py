import subprocess, sys

def run(command):
    try:
        out = subprocess.check_output(command, shell=True, encoding='utf-8')
        return out
    except subprocess.CalledProcessError as e:
        # print("command '{}' return with error (code {}): {}".format(e.cmd, e.returncode, e.output))
        return

def main():
    OS = sys.platform
    problem, code = sys.argv[1:]
    success, fail, cnt = 0, 0, 0

    if OS in ['darwin', 'linux']:
        
        find = 'find ./ -name ' + problem + ' -type d'
        p_out = run(find)
        if not p_out:
            print('해당 문제의 테스트케이스를 찾을 수 없습니다.')
            return

        find_in = 'find ' + p_out.strip('\n') + ' -name "*.in" | sort -n'
        in_list = run(find_in).split()
        ext = code.split('.')[-1]

        if ext == 'cpp':
            # Compile
            # https://help.acmicpc.net/language/info
            compile = 'g++ ' + code + ' -o Main -O2 -Wall -std=gnu++17'
            run(compile)

            for i in in_list:
                cnt += 1
                index = i.split('/')[-1].split('.')[0]
                exe = run('timeout -s 9 3s ./Main  <' + i)

                find_out = 'find ' + p_out.strip('\n') + ' -name "'+ index + '.out"'
                out_exist = run(find_out)
                if not out_exist:
                    print(i, '.out이 존재하지 않습니다.')
                    fail += 1
                    continue
                
                result = run('cat ' + out_exist.strip('\n'))

                if exe == result:
                    success += 1
                else:
                    print(i, '실패')
                    fail += 1

            # print(ext)
        # elif ext == 'python':
        # 테케 실행
    print('테스트케이스:', cnt)
    print('통과', success)
    print('실패', fail)

main()