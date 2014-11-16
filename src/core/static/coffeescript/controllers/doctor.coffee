Disrupt.controller 'Doctor', ($scope, $http, $location) ->
    _.extend $scope,
        is_diagnosis_hidden: false
        is_treatment_hidden: false
        is_lifestyle_hidden: false
        is_test_results_hidden: false
        patient_name: 'Sam Deng'
        reason_for_visit: 'Diabetic care'
        diagnosis: 'Sams foot turned into one giant calluses'
        test_results: {'date':'10/10/2014', 'expected':'10/10/2014'}
        toggleSection: (section)->
            if section == 'diagnosis'
                $scope.is_diagnosis_hidden = !$scope.is_diagnosis_hidden
            if section == 'treatment'
                $scope.is_treatment_hidden = !$scope.is_treatment_hidden
            if section == 'lifestyle'
                $scope.is_lifestyle_hidden = !$scope.is_lifestyle_hidden
            if section == 'tests_ordered'
                $scope.is_test_results_hidden = !$scope.is_test_results_hidden



        treatment_options: [
                        {'name':'Neuropathy',content:"Although it can hurt, diabetic nerve damage can also lessen your ability to feel pain, heat, and cold. Loss of feeling often means you may not feel a foot injury. You could have a tack or stone in your shoe and walk on it all day without knowing. You could get a blister and not feel it. You might not notice a foot injury until the skin breaks down and becomes infected. Nerve damage can also lead to changes in the shape of your feet and toes. Ask your health care provider about special therapeutic shoes, rather than forcing deformed feet and toes into regular shoes."},
                        {'name':'Skin Changes','content':"Diabetes can cause changes in the skin of your foot. At times your foot may become very dry. The skin may peel and crack. The problem is that the nerves that control the oil and moisture in your foot no longer work. After bathing, dry your feet and seal in the remaining moisture with a thin coat of plain petroleum jelly, an unscented hand cream, or other such products. Do not put oils or creams between your toes. The extra moisture can lead to infection. Also, don't soak your feet — that can dry your skin."},
                        {'name':'Calluses','content':"Calluses occur more often and build up faster on the feet of people with diabetes. This is because there are high-pressure areas under the foot. Too much callus may mean that you will need therapeutic shoes and inserts. Calluses, if not trimmed, get very thick, break down, and turn into ulcers (open sores). Never try to cut calluses or corns yourself - this can lead to ulcers and infection. Let your health care provider cut your calluses. Also, do not try to remove calluses and corns with chemical agents. These products can burn your skin. Using a pumice stone every day will help keep calluses under control. It is best to use the pumice stone on wet skin. Put on lotion right after you use the pumice stone."},
                        {'name':'Foot Ulcers','content':"Ulcers occur most often on the ball of the foot or on the bottom of the big toe. Ulcers on the sides of the foot are usually due to poorly fitting shoes. Remember, even though some ulcers do not hurt, every ulcer should be seen by your health care provider right away. Neglecting ulcers can result in infections, which in turn can lead to loss of a limb. What your health care provider will do varies with your ulcer. Your health care provider may take x-rays of your foot to make sure the bone is not infected. The health care provider may clean out any dead and infected tissue. You may need to go into the hospital for this. Also, the health care provider may culture the wound to find out what type of infection you have, and which antibiotic will work best. Keeping off your feet is very important. Walking on an ulcer can make it get larger and force the infection deeper into your foot. Your health care provider may put a special shoe, brace, or cast on your foot to protect it. If your ulcer is not healing and your circulation is poor, your health care provider may need to refer you to a vascular surgeon. Good diabetes control is important. High blood glucose levels make it hard to fight infection. After the foot ulcer heals, treat your foot carefully. Scar tissue under the healed wound will break down easily. You may need to wear special shoes after the ulcer is healed to protect this area and to prevent the ulcer from returning."},
                        {'name':'Poor Circulation','content':"Poor circulation (blood flow) can make your foot less able to fight infection and to heal. Diabetes causes blood vessels of the foot and leg to narrow and harden. You can control some of the things that cause poor blood flow. Don't smoke; smoking makes arteries harden faster. Also, follow your health care provider's advice for keeping your blood pressure and cholesterol under control. If your feet are cold, you may be tempted to warm them. Unfortunately, if your feet cannot feel heat, it is easy for you to burn them with hot water, hot water bottles, or heating pads. The best way to help cold feet is to wear warm socks. Some people feel pain in their calves when walking fast, up a hill, or on a hard surface. This condition is called intermittent claudication. Stopping to rest for a few moments should end the pain. If you have these symptoms, you must stop smoking. Work with your health care provider to get started on a walking program. Some people can be helped with medication to improve circulation. Exercise is good for poor circulation. It stimulates blood flow in the legs and feet. Walk in sturdy, good-fitting, comfortable shoes, but don't walk when you have open sores."},
                        {'name':'Amputation','content':"People with diabetes are far more likely to have a foot or leg amputated than other people. The problem? Many people with diabetes have peripheral arterial disease (PAD), which reduces blood flow to the feet. Also, many people with diabetes have nerve disease, which reduces sensation. Together, these problems make it easy to get ulcers and infections that may lead to amputation. Most amputations are preventable with regular care and proper footwear. For these reasons, take good care of your feet and see your health care provider right away about foot problems. Ask about prescription shoes that are covered by Medicare and other insurance. Always follow your health care provider's advice when caring for ulcers or other foot problems. One of the biggest threats to your feet is smoking. Smoking affects small blood vessels. It can cause decreased blood flow to the feet and make wounds heal slowly. A lot of people with diabetes who need amputations are smokers."},
                    ]

        selected_lifestyle_choices: []
        lifestyle_choices: [
                        {'name':'Weight Loss', 'selected':true, 'content':'Weight Loss'},
                        {'name':'Nutrition', 'selected':true, 'content':'Nutrition'},
                        {'name':'Safety Precautions', 'selected':false, 'content':'Safety Precautions'},
                        {'name':'Mental Health', 'selected':false, 'content':'Mental Health'},
                    ]

    $scope.$watch 'lifestyle_choices',
        (lifestyle_choices)->
            $scope.selected_lifestyle_choices = []
            for choice in lifestyle_choices
                if choice.selected
                    $scope.selected_lifestyle_choices.push choice


        true



    $scope.selected_treatment_option = $scope.treatment_options[0]
