import random

def is_web():
    return "__BRYTHON__" in globals()

def write(message, end='\n'):
    if is_web():
        from browser import document
        console = document.getElementById('console')
        p = document.createElement('p')
        p.textContent = '§ ' + message
        console.appendChild(p)
        console.scrollTop = console.scrollHeight
    else:
        print(message, end=end)


async def read():
    if is_web():
        from browser import document, aio
        inp = document.getElementById('input')
        while True:
            event = await aio.event(inp, 'keydown')
            if event.key == 'Enter':
                tmp = event.target.value
                event.target.value = ''
                write(tmp)
                return tmp
    else:
        return input()


def run(function):
    if is_web():
        from browser import aio
        aio.run(function())
    else:
        import asyncio
        asyncio.run(function())
"""
функция game. Главная функция.
"""
async def gamme():
    write('\t\t\t JOUST')
    write('\t       CREATIVE COMPUTING  MORRISTOWN NEW JERSEY')
    write('\n\n\n')
    write("WHAT IS YOUR NAME, PLEASE: ")
    player_name = await read()

    write(f"SIR {player_name}, YOU ARE A MEDIEVAL KNIGHT IN A JOUSTING TOURNAMENT.")
    write("THE PRIZE TO THE WINNER IS THE PRINCES'S HAND IN MARRIAGE.")
    write("TO WIN, YOU MUST BEAT FOUR OTHER KNIGHTS.")
    write("TO JOUST, YOU PICK AN AIMING POINT FOR THE LANCE,")
    write("AND THEN ONE OF FROM 3 TO 6 DIFFERENT POSSIBLE DEFENSE POSITIONS.")
    write("THE AIMING POINTS ARE:")
    write("1- HELM")
    write("2- UPPER LEFT (OF SHIELD)")
    write("3- UPPER MIDDLE")
    write("4- UPPER RIGHT")
    write("5- LOWER LEFT")
    write("6- LOWER MIDDLE")
    write("7- LOWER RIGHT")
    write("8- BASE OF SHIELD\n")

    write("IF YOU BREAK A LANCE OR LOSE A HELM, YOU WILL BE GIVEN ANOTHER.")
    write("GOOD LUCK, SIR!\n")
    for A in range(4):
        opponent = ["GOLD KNIGHT", "SILVER KNIGHT", "RED KNIGHT", "BLACK KNIGHT"][A]
        write(f"THIS IS YOUR {['FIRST', 'SECOND', 'THIRD', 'FINAL'][A]} JOUST. YOU ARE UP AGAINST THE {opponent}.\n")
        flag = 0
        W = 0
        while flag == 0:
            B = 0
            while B < 1 or B > 8:
                write("YOUR AIMING POINT (1-8): ")
                B = await read()
                B = int(B)
            write("YOU MAY USE ONE OF THESE DEFENSES:")

            if B in [1, 5, 7]:
                write(" 4-STEADY SEAT, 5-SHIELD HIGH, 6-SHIELD LOW.")
            elif B in [3, 6]:
                write(" 1-LOWER HELM, 2-RIGHT LEAN, 3-LEFT LEAN, 4-STEADY SEAT, ")
                write(" 5-SHIELD HIGH, 6-SHIELD LOW.")
            elif B == 2:
                write(" 3-LEFT LEAN, 4-STEADY SEAT, 5-SHIELD HIGH, 6-SHIELD LOW.")
            elif B == 4:
                write(" 2-RIGHT LEAN, 4-STEADY SEAT, 5-SHIELD HIGH, 6-SHIELD LOW.")
            elif B == 8:
                write(" 1-LOWER HELM, 4-STEADY SEAT, 5-SHIELD HIGH, 6-SHIELD LOW.")
            write("WHAT IS YOUR CHOICE: ")
            C = await read()
            C = int(C)
            field = [[1, 1, 1, 3, 5, 1],
                    [5, 4, 1, 4, 4, 1],
                    [6, 5, 2, 4, 8, 7],
                    [2, 1, 4, 2, 2, 5],
                    [4, 8, 1, 4, 1, 4],
                    [8, 2, 4, 8, 6, 4],
                    [2, 1, 8, 2, 2, 2],
                    [4, 2, 6, 4, 6, 4]]
            s1 = 1
            D = random.randint(1, 8)
            if 0 < C < 7:
                s1 = field[D - 1][C - 1]
            scripts = {1: ["HE MISSED YOU!", 0],
                       2: ["HE HIT YOUR SHIELD BUT IT GLANCED OFF.", 0],
                       3: ["HE KNOCKED OFF YOUR HELM!", 0],
                       4: ["HE BROKE HIS LANCE.", 0],
                       5: ["HE HAS UNSEATED YOU(THUD!)", 5],
                       6: ["HE HAS BROKEN HIS LANCE, INJURED AND UNSEATED YOU (OUCH!)", 5],
                       7: ["HE HAS INJURED AND UNSEATED YOU (CRASH!)", 5],
                       8: ["HE HAS BROKEN HIS LANCE AND UNSEATED YOU (CLANG! )", 5]}

            pr, S = scripts[s1]
            write(pr)

            D = random.randint(1, 8)
            ##
            if D in (1, 5, 7):
                E = random.randint(4, 6)
            elif D == 2:
                E = random.randint(3, 6)
            elif D in (3, 6):
                E = random.randint(1, 6)
            elif D == 4:
                E = random.choice((2, 4, 5, 6))
            elif D == 8:
                E = random.choice((1, 4, 5, 6))
            else:
                E = 6
            
            field2 = [[1, 5, 6, 2, 4, 8, 2, 4],
                     [1, 4, 5, 1, 8, 2, 1, 2],
                     [1, 1, 2, 4, 1, 4, 8, 5],
                     [3, 4, 4, 2, 4, 8, 2, 4],
                     [5, 4, 8, 2, 1, 6, 2, 6],
                     [1, 1, 7, 5, 4, 4, 2, 4]]
            s2 = field2[E - 1][B - 1]

            scripts2 = {1: ["YOU MISSED HIM (HISS!)", 0],
                        2: ["YOU HIT HIS SHIELD BUT GLANCED OFF.", 0],
                        3: ["YOU KNOCKED OFF HIS HELM!(CHEERS!)", 0],
                        4: ["YOU BROKE YOUR LANCE(CRACK...)", 0],
                        5: ["YOU UNSEATED HIM (LOUD CHEERS AND HUZZAHS!!)", 5],
                        6: ["YOU BROKE YOUR LANCE, BUT UNSEATED AND INJURED YOUR FOE.", 5],
                        7: ["YOU INJURED AND UNSEATED YOUR OPPONENT.", 5],
                        8: ["YOU BROKE YOUR LANCE BUT UNSEATED YOUR OPPONENT.", 5]}
            pr2, T = scripts2[s2]
            write(pr2)
            if S == T and S == 0:
                write("YOU ARE NOW READY TO TRY AGAIN.")
                continue
            elif S == T:
                write("TOO BAD, YOU BOTH LOST. AT LEAST YOUR HONOR IS INTACT."
                      "SORRY, BETTER LUCK NEXT JOUST.")
                W = 2
            elif S < T:
                write("YOU HAVE WON THIS JOUST.")
                W = 3
            elif S > T:
                write("TOO BAD, YOU LOST. HOPE YOUR INSURANCE WAS PAID UP."
                      "SORRY, BETTER LUCK NEXT JOUST.")
                W = 4
            break
        if W in [2,4]:
            quit()
    write("HOORAY! YOU ARE THE WINNER. HERE COMES THE BRIDE!")
    
run(gamme)