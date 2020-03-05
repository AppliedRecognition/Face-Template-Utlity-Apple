import XCTest
@testable import FaceTemplateUtility

final class FaceTemplateUtilityTests: XCTestCase {
    
    let userFaceTemplates: [[(String,[Float])]] = [
        [
            ("PdeWy70aox09peyvvCKJ0L4LZjI97inwvGrHED3TEve+Rhf2PcoLTz0/4rI9Jw2kvZPdX70g2GG8vH/TORB6gD1pFaE+HXWCvYN/f7yJtMI8EHqAvUaocLyT3V+9g39/PY+hyT3Xlss9Yb9ovYN/fz3TEve9+7VsPY+hyb3lIkc9xYd7PYN/f71wa9q+SpvKvh11grv81mE9Yb9ovh+3bLu0mSA+H7dsPTmtb72qcIM9LULoPVQz7LzQ0Q098q3EPaXsr72zeCu8ibTCu5B6gD2c5Qc9WvmqPVr5qr2zeCs9WvmqvWG/aL1hv2g+BuJevgkkSL2YYTM6EHqAPSDYYb28f9O9rvRXvSDYYT1hv2g9Jw2kPOZDPD4NqBw9oWjbu1i3wLxYt8A+H7dsvDSZILuQeoA9P+KyvemmG70aox08ibTCOpB6gL0g2GG9P+KyPcEDp74tQug8ascQvNDRDb4P6ga+Q9YMPcoLTz4EoHQ98q3EPH8YS705rW89CbTCu7SZIDkQeoA+ABygPaFo2z1Nbi6+LULoPaXsr744jHo9CbTCPiH5Vj2Df38+FG3au7SZIDwQeoA9D1mLPgtmMj2haNu9h3LYPnD8VD0U/lS9Yb9ovVr5qju0mSC8ascQPQQP+b3TEvc9k91fvbx/073cGp++BKB0vYN/fz1/GEs=",[0.10526808351278305,-0.037753213196992874,0.081017844378948212,-0.0099205523729324341,-0.13613203167915344,0.11629092693328857,-0.014329686760902405,0.10306351631879807,-0.19345077872276306,0.098654381930828094,0.046847052872180939,0.040784493088722229,-0.07219957560300827,-0.039268855005502701,-0.023010170087218285,0.00013778544962406158,0.056905392557382584,0.15376856923103333,-0.064208023250102997,-0.016809824854135513,0.0088182687759399414,-0.048500478267669678,-0.018049893900752068,-0.064208023250102997,0.070132799446582794,0.10526808351278305,0.055114179849624634,-0.064208023250102997,0.10306351631879807,-0.12290462851524353,0.070132799446582794,-0.11188178509473801,0.096449814736843109,0.064208023250102997,-0.058696605265140533,-0.19785991311073303,-0.15376856923103333,-0.007715985644608736,0.055114179849624634,-0.15597313642501831,-0.0055114179849624634,0.15597313642501831,0.045331414788961411,-0.083222411572933197,0.042300134897232056,0.051807329058647156,-0.025490308180451393,0.11849549412727356,0.081017844378948212,-0.087631545960903168,-0.016809824854135513,-0.0044091343879699707,0.076608709990978241,0.053460754454135895,0.053460754454135895,-0.087631545960903168,0.053460754454135895,-0.055114179849624634,-0.055114179849624634,0.13172289729118347,-0.13392746448516846,-0.074404142796993256,0.00055114179849624634,0.039268855005502701,-0.092040680348873138,-0.085426978766918182,-0.039268855005502701,0.055114179849624634,0.040784493088722229,0.028108231723308563,0.13833659887313843,0.078813277184963226,-0.003306850790977478,-0.013227403163909912,0.15597313642501831,-0.011022835969924927,-0.0044091343879699707,0.046847052872180939,-0.11408635228872299,-0.037753213196992874,0.016809824854135513,0.0011022835969924927,-0.039268855005502701,-0.046847052872180939,0.094245247542858124,-0.16920053958892822,0.014329686760902405,-0.025490308180451393,-0.14054116606712341,-0.19124621152877808,0.098654381930828094,0.12951833009719849,0.11849549412727356,0.015569756738841534,-0.045331414788961411,0.033619649708271027,-0.0055114179849624634,0.00013778544962406158,0.12510919570922852,0.078813277184963226,0.050153903663158417,-0.16920053958892822,0.081017844378948212,-0.18022337555885315,0.033619649708271027,0.1581777036190033,0.064208023250102997,0.14495030045509338,-0.0055114179849624634,0.0088182687759399414,0.034997504204511642,0.13613203167915344,0.078813277184963226,-0.066137015819549561,0.23533755540847778,0.036375358700752258,-0.055114179849624634,-0.053460754454135895,0.0055114179849624634,-0.014329686760902405,0.032241795212030411,-0.10306351631879807,0.07219957560300827,-0.092040680348873138,-0.10747265070676804,-0.12951833009719849,-0.064208023250102997,0.062279026955366135]),
            ("u25lWL2AMyo9hDw3PYxOUL27fQk91FJCvUVr7bwe7jq9aW3mPc9a0L0RRcE+JcJ3vG5lWLz9S629CxBzvYhFQz2ZV9o+CnGFu8apyb0+l7A7nu46vVqHkLxuZVi82oeQO+5lWD4FehM9RWvtvegwCT2ip9C9cOERvG5lWL27fQk+AIKhPIxOULzw4RG9/A3RvP1LrT1pbeY9toWXviDLBTyXexA+GVfavDLMAr2ZV9o5Hu46u+5lWDxuZVg9nf/VPi01or22hZc9TEApPP1LrT2d/9W6nu46PZCm074H9cy8uQFQvG5lWLwe7jo+Y9eGvM9a0L1Fa+28RqnJPRd7EL4H9cw9EUXBvOW0UD0XexC8oqfQPQTbJT4quek9eFQ7vM9a0L0LEHM+NKjMvAsQcz2U/1c9cOERvgztPr27fQm98h7tPRFFwTwyzAK+GVfaPcVr7b40qMw8z1rQvYQ8N71pbea9CxBzPcVr7T22hZc+AIKhPIxOUL14VDs9eFQ7vOW0UL0XexA99xZfPbt9Cb0RRcG+I0a+Pg9o9748G/e9PpewPhvTkz14VDs+LTWiPNqHkD0qGvu8jE5QPi+xWz4H9cy9PpewPoSLrrzw4RG9CxBzO+5lWL2IRUM8Hu46vIxOUL2EPDc9/A3RvaKn0L38DdG+G9OTvWH6uz2AMyo=",[-0.003637632355093956,-0.062597587704658508,0.064567975699901581,0.068508744239807129,-0.091547079384326935,0.10367251932621002,-0.048198629170656204,-0.0097003523260354996,-0.056989572942256927,0.10124742984771729,-0.035466913133859634,0.16187463700771332,-0.014550529420375824,-0.030919874086976051,-0.033951234072446823,-0.066538356244564056,0.074874594807624817,0.13519866764545441,-0.0060627204366028309,-0.046531379222869873,0.0048501761630177498,-0.053351938724517822,-0.014550529420375824,-0.026675969362258911,0.007275264710187912,0.13034848868846893,0.048198629170656204,-0.11337286978960037,0.079421639442443848,-0.05880839005112648,-0.014550529420375824,-0.091547079384326935,0.12549830973148346,0.017127186059951782,-0.02940419502556324,-0.12307322770357132,-0.030919874086976051,0.056989572942256927,0.089121989905834198,-0.15702445805072784,0.018491297960281372,0.14974918961524963,-0.010912897065281868,-0.074874594807624817,0.00015156800509430468,-0.007275264710187912,0.014550529420375824,0.077148117125034332,0.16914990544319153,-0.089121989905834198,0.049865875393152237,0.030919874086976051,0.077148117125034332,-0.0012125440407544374,0.070630691945552826,-0.13277357816696167,-0.022583633661270142,-0.014550529420375824,-0.0097003523260354996,0.22250184416770935,-0.025311857461929321,-0.048198629170656204,-0.012125440873205662,0.036982595920562744,-0.13277357816696167,0.035466913133859634,-0.028040081262588501,0.036982595920562744,-0.019855409860610962,0.032435555011034012,0.16672481596469879,0.060627203434705734,-0.025311857461929321,-0.033951234072446823,0.17642515897750854,-0.0084878085181117058,0.07275264710187912,0.05880839005112648,-0.13762375712394714,-0.091547079384326935,-0.11822304874658585,0.035466913133859634,0.010912897065281868,-0.14974918961524963,0.096397258341312408,-0.17642515897750854,0.025311857461929321,-0.064567975699901581,-0.056989572942256927,-0.033951234072446823,0.096397258341312408,0.089121989905834198,0.12549830973148346,0.017127186059951782,-0.060627203434705734,0.060627203434705734,-0.028040081262588501,-0.036982595920562744,0.12064813822507858,0.091547079384326935,-0.035466913133859634,-0.15944954752922058,0.14004884660243988,-0.18370042741298676,-0.046531379222869873,0.15217427909374237,0.060627203434705734,0.16914990544319153,0.026675969362258911,0.041529636830091476,-0.017127186059951782,0.17157499492168427,0.13277357816696167,-0.046531379222869873,0.25887817144393921,-0.02940419502556324,-0.033951234072446823,0.007275264710187912,-0.066538356244564056,0.0097003523260354996,-0.017127186059951782,-0.064567975699901581,0.12307322770357132,-0.079421639442443848,-0.12307322770357132,-0.15217427909374237,-0.055170755833387375,0.062597587704658508])
        ],
        [
            ("PIfCur1ejve9+CcVPT0suDuOb/q8udYYPDIL+DsOb/o7+UP1PV6O9z2arZm9gaPrvMPZ+L1Khzc9EuN6vaOUmT4+2Ai8+UP1PjO3SLzD2fg8w9n4vXRCBr4E+oo9sO8ZvCA9+TzD2fg87iM2vjpkiLoOb/q90BeXvWXKpj3QF5c+IelJvTDvGT3Y/pc92P6XvQfCuj4mXMk9AjJavQ1TGj3CvRi9udYYvR6SqT4HNEq7+UP1PaOUmT21Ypg970AWPNfht7yHwro87iM2vWXKpj2arZk7sgv4PeZZFr4QG0q9nyEZu1Wn970Hwro+bZTGPY2aUr2NmlK9JLF5PRhz2j4E+oq9qAgZvfyalT3mWRY9ZcqmvMPZ+D0w7xk93XIXvQIyWr1RNHc96syWPbnWGDwgPfm7Vaf3vA5v+r21Ypg+BzRKPbVimD21Ypi9mq2ZPhkCSr4q0Em9hYj6vfOzlr0ksXk9GHPaPT0suL3zs5a+OCrIPYGj672Jbgo+FI7KvPlD9Tx7fbU+FsiKPVfht70ekqm9/JqVPGd19rwOb/o9ZcqmvOMCdr34JxU+CW4Kve9AFjsOb/o8w9n4PgCHCzzjAna+BzRKPax7mbz5Q/W9PSy4vQfCur4ddcm9vkmYPY2aUr3qzJa95lkWvZHGmr4mXMm9JLF5ve9AFr10QgY=",[0.016572345048189163,-0.054335560649633408,-0.12116829305887222,0.046185225248336792,0.0043468447402119637,-0.02268509566783905,0.010867111384868622,0.0021734223701059818,0.0076069780625402927,0.054335560649633408,0.075526423752307892,-0.063300929963588715,-0.023907646536827087,-0.049445357173681259,0.035861469805240631,-0.079873271286487579,0.18637096881866455,-0.030427912250161171,0.17550384998321533,-0.023907646536827087,0.023907646536827087,-0.059633277356624603,-0.129861980676651,0.086393542587757111,-0.0097804004326462746,0.023907646536827087,0.029069524258375168,-0.18202412128448486,-0.00054335559252649546,-0.10160749405622482,-0.056101463735103607,0.10160749405622482,0.15811647474765778,-0.043196771293878555,0.10595434159040451,0.10595434159040451,-0.033144690096378326,0.16246332228183746,0.031786300241947174,-0.034503079950809479,0.095087230205535889,-0.090740382671356201,-0.038714084774255753,0.13203540444374084,-0.0076069780625402927,0.079873271286487579,0.088566958904266357,0.11682145297527313,0.026352746412158012,-0.016572345048189163,0.029069524258375168,-0.056101463735103607,0.075526423752307892,0.0054335556924343109,0.11247460544109344,-0.14072909951210022,-0.077699847519397736,-0.0032601335551589727,-0.033144690096378326,0.23201283812522888,0.069141998887062073,-0.069141998887062073,-0.04020831361413002,0.037219859659671783,0.129861980676651,-0.082046695053577423,-0.12334171682596207,0.11247460544109344,0.056101463735103607,-0.023907646536827087,0.043196771293878555,0.10812776535749435,-0.031786300241947174,-0.051075424998998642,0.11464802920818329,0.090740382671356201,0.0097804004326462746,-0.0032601335551589727,-0.0086936894804239273,-0.088566958904266357,0.13203540444374084,0.088566958904266357,0.088566958904266357,-0.075526423752307892,0.14942279458045959,-0.16681016981601715,-0.065202668309211731,-0.11899487674236298,-0.04020831361413002,0.037219859659671783,0.046185225248336792,-0.11899487674236298,-0.17985069751739502,0.063300929963588715,-0.067104414105415344,0.14507594704627991,-0.030427912250161171,0.015349795110523701,0.14724937081336975,0.052705492824316025,-0.038714084774255753,-0.12334171682596207,0.014127245172858238,-0.0086936894804239273,0.056101463735103607,-0.027711134403944016,-0.12116829305887222,0.13420882821083069,-0.11682145297527313,0.0021734223701059818,0.023907646536827087,0.12551514804363251,0.027711134403944016,-0.13203540444374084,0.084220118820667267,-0.030427912250161171,-0.046185225248336792,-0.033144690096378326,-0.15376962721347809,-0.092913806438446045,0.069141998887062073,-0.11464802920818329,-0.11247460544109344,-0.071179583668708801,-0.16246332228183746,-0.04020831361413002,-0.11682145297527313,-0.059633277356624603]),
            ("PDLdg71Ff0G93lbpPG58r7zanPY8uRNtu258rztufK+7Hv3KPYRJKT38Jn++FurnvYxcDL0dv888uRNtvWmEwT3Kdy+9kLT9PiDaw71anPY6Hv3Kvaynmb3tPrQ9iFKbvP1kejxGvT09mWbevoSYqDyBLjS9/CZ/vVMpED3Ah1M+UA4bvIEuND2it709xX9BvAseET4g2sM9MQCKvZC0/T0+qlm9wIdTO258rz3ZXvq8z28ePZ4PTT2IUps+DPsKvIxcDDz9ZHo9Cx4RvReJ5T40un08bnyvPehGxb3ZXvq9eGyMvZ4PTbzlys4+Q6JIPgMLLr2QtP28Mt2DPPD4pj4Ajza9u49kvbaXdj3UZww9Hb/PPFqc9r2nr6s9ore9vIEuNLvufK8+BYclPM9vHjz9ZHq7nv3KvYRJKb1phME+D3cBO579yj0qK6K9TFQpPehGxb3ZXvq9tpd2vgp/E72xn4i8ore9PUxUKb4vwo6+I1a7PXD4przlys4+Cn8TvVqc9j1w+KY+Furnu+58r7yMXAy9u49kO+58r73Ah1M9eGyMPM9vHr3Ah1M9z28evhHy+T031XI91GcMPiDawz14bIy+BYclPSP1uLz9ZHq8Mt2DvDLdg73eVum9tpd2PYxcDL2nr6u98jaivgp/E740un28/WR6vXhsjDyXieU=",[0.01091707032173872,-0.048217061907052994,-0.10856420546770096,0.014556094072759151,-0.026686172932386398,0.022592270746827126,-0.0036390235181897879,0.0036390235181897879,-0.0024260156787931919,0.064592666923999786,0.12312030047178268,-0.14738045632839203,-0.068534940481185913,-0.038513001054525375,0.022592270746827126,-0.057011369615793228,0.098860137164592743,-0.070657707750797272,0.15708450973033905,-0.053372345864772797,0.00060650391969829798,-0.084304042160511017,-0.11584225296974182,0.066563807427883148,-0.030931700021028519,0.012130078859627247,0.074903234839439392,-0.25897717475891113,0.015769101679325104,-0.12312030047178268,-0.051552832126617432,0.094008110463619232,0.20317880809307098,-0.015769101679325104,0.079452015459537506,0.096434123814105988,-0.0084910551086068153,0.15708450973033905,0.043213404715061188,-0.070657707750797272,0.046549174934625626,-0.094008110463619232,0.0036390235181897879,0.10613818466663361,-0.025321539491415024,0.077177621424198151,0.066563807427883148,0.13767638802528381,-0.017133735120296478,0.030931700021028519,0.033964220434427261,-0.036996740847826004,0.17649264633655548,0.014556094072759151,0.11341623216867447,-0.10613818466663361,-0.06065039336681366,-0.077177621424198151,-0.028050806373357773,0.19104874134063721,0.12797233462333679,-0.070657707750797272,-0.01091707032173872,0.029415439814329147,0.12554630637168884,-0.09158208966255188,-0.089156076312065125,0.10371217131614685,0.038513001054525375,0.013343086466193199,-0.081878028810024261,0.079452015459537506,-0.015769101679325104,-0.0072780470363795757,0.13039834797382355,0.025321539491415024,0.030931700021028519,-0.0048520313575863838,-0.064592666923999786,-0.057011369615793228,0.14010240137577057,0.0048520313575863838,0.04154551774263382,-0.049884948879480362,0.11341623216867447,-0.10613818466663361,-0.089156076312065125,-0.13525037467479706,-0.086730062961578369,-0.019863003864884377,0.049884948879480362,-0.17164060473442078,-0.159510537981987,0.058830879628658295,-0.028050806373357773,0.13525037467479706,-0.053372345864772797,0.058830879628658295,0.14738045632839203,-0.0072780470363795757,-0.017133735120296478,-0.09158208966255188,0.0072780470363795757,-0.094008110463619232,0.06065039336681366,0.025321539491415024,-0.094008110463619232,0.1012861579656601,-0.14252842962741852,0.044881291687488556,0.10371217131614685,0.15708450973033905,0.06065039336681366,-0.13039834797382355,0.040029257535934448,-0.030931700021028519,-0.01091707032173872,-0.01091707032173872,-0.10856420546770096,-0.089156076312065125,0.068534940481185913,-0.081878028810024261,-0.11826826632022858,-0.13525037467479706,-0.17649264633655548,-0.030931700021028519,-0.06065039336681366,0.018498370423913002])
        ]
    ]
    
    let similarityThreshold: Float = 4.0
    
    // MARK: - Face template conversion tests
    
    func test_convertStringToFaceTemplate_succeeds() {
        XCTAssertNoThrow(try userFaceTemplates.forEach({
            try $0.forEach({
                let template = try FaceTemplateUtility.faceTemplateFromString($0.0)
                XCTAssertEqual(template, $0.1)
            })
        }))
    }
    
    func test_convertInvalidStringToFaceTemplate_fails() {
        XCTAssertThrowsError(try FaceTemplateUtility.faceTemplateFromString("$nonsense"))
    }
    
    func test_convertFaceTemplateToString_succeeds() {
        userFaceTemplates.forEach({
            $0.forEach({
                XCTAssertEqual(FaceTemplateUtility.stringFromFaceTemplate($0.1), $0.0)
            })
        })
    }
    
    // MARK: - Face template comparison tests
    
    func test_compareSameUser_returnsHighScore() {
        userFaceTemplates.forEach({
            for i in 0..<$0.count-1 {
                let score = FaceTemplateUtility.compareFaceTemplate($0[i].1, to: $0[i+1].1)
                XCTAssertGreaterThanOrEqual(score, self.similarityThreshold)
            }
        })
    }
    
    func test_compareDifferentUsers_returnsLowScore() {
        for i in 0..<userFaceTemplates.count-1 {
            let user1Templates = userFaceTemplates[i]
            let user2Templates = userFaceTemplates[i+1]
            user1Templates.forEach({ template1 in
                user2Templates.forEach({ template2 in
                    let score = FaceTemplateUtility.compareFaceTemplate(template1.1, to: template2.1)
                    XCTAssertLessThan(score, self.similarityThreshold)
                })
            })
        }
    }
    
    func test_getTemplateNorms_equalsOne() {
        userFaceTemplates.forEach({
            $0.forEach({
                let norm = FaceTemplateUtility.normForTemplate($0.1)
                XCTAssertEqual(norm, 1, accuracy: 0.0001)
            })
        })
    }
    
    func test_getFakeTemplateNorms_doesNotEqualOne() {
        let template: [Float] = [0.1,1,0,0.4,0.6,0.9]
        let norm = FaceTemplateUtility.normForTemplate(template)
        XCTAssertNotEqual(1, norm, accuracy: 0.0001)
    }
    
    func test_compareSameUserWithTemplateNorms_returnsHighScore() {
        userFaceTemplates.forEach({
            for i in 0..<$0.count-1 {
                let norm1 = FaceTemplateUtility.normForTemplate($0[i].1)
                let norm2 = FaceTemplateUtility.normForTemplate($0[i+1].1)
                let score = FaceTemplateUtility.compareFaceTemplate($0[i].1, withNorm: norm1, to: $0[i+1].1, withNorm: norm2)
                XCTAssertGreaterThanOrEqual(score, self.similarityThreshold)
            }
        })
    }

    static var allTests = [
        ("test_convertStringToFaceTemplate_succeeds", test_convertStringToFaceTemplate_succeeds),
        ("test_convertInvalidStringToFaceTemplate_fails", test_convertInvalidStringToFaceTemplate_fails),
        ("test_convertFaceTemplateToString_succeeds", test_convertFaceTemplateToString_succeeds),
        ("test_compareSameUser_returnsHighScore", test_compareSameUser_returnsHighScore),
        ("test_compareDifferentUsers_returnsLowScore", test_compareDifferentUsers_returnsLowScore),
        ("test_getTemplateNorms_equalsOne", test_getTemplateNorms_equalsOne),
        ("test_getFakeTemplateNorms_doesNotEqualOne", test_getFakeTemplateNorms_doesNotEqualOne),
        ("test_compareSameUserWithTemplateNorms_returnsHighScore", test_compareSameUserWithTemplateNorms_returnsHighScore),
    ]
}
