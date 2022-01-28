import argparse 

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='test argparser')

    #User, password, host, port, databse name, table name, url of the csv 
    parser.add_argument('--test_user', help='print user name')
    parser.add_argument('--integers', metavar='N', type=int, nargs='+', help='an integer for the accumulator')
    parser.add_argument('--sum', dest='accumulate', action='store_const',
                        const=sum, default=max, help='sum the integers (default: find the max)')
    args = parser.parse_args()

    user = args.test_user

    print(user, "is testing: ", args.accumulate(args.integers))


# Test in command prompt: 
# python arg_parse_4fun.py --test_user="CJJ"
# python arg_parse_4fun.py --test_user="CJJ" --integers 1 2 3 4
# python arg_parse_4fun.py --test_user="CJJ" --integers 1 2 3 4 --sum