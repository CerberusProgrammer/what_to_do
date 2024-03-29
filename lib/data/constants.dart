const String activityDatabase = "wtd.db";
const String userDatabase = "std.db";
const String activityTable = "activities";
const String userTable = "users";
const List<String> textPresentationIntro = [
  'a new chapter!',
  'a fresh start!',
  'a new beginning!',
  'your next adventure!',
  'a world of possibilities!',
];
const List<String> textPresentation = [
  "What's next?",
  "Ready for a challenge?",
  "What's holding you back?",
  "Explore something new?",
  "What's next on your list?",
  "Feeling adventurous?",
  "What's your next goal?",
  "Learn something new?",
  "Make today count?",
  "Push yourself further?",
  "What can you accomplish?",
  "What's your next adventure?",
  "Improve one thing today?",
  "Do the impossible?",
  "Try something new?",
  "Make a positive impact?",
  "Challenge yourself?",
  "Achieve your dreams?",
  "Thank your future self?",
  "Make today memorable?",
  "What can you do today?",
  "How will you grow today?",
  "What opportunities will you seize?",
  "What will you accomplish?",
  "What will make today special?",
  "What's your next adventure?",
  "What can you learn today?",
  "What will you achieve?",
  "What's your next step?",
  "What will you do differently today?",
  "What can you do to be your best self?",
  "What's your next big idea?",
  "What are you waiting for?",
  "How can you make an impact today?",
  "What will you do to make a difference?",
  "What's your next success story?",
  "How can you make today a win?",
  "What can you do to overcome challenges?",
  "What will you do to reach your goals?",
  "How can you make today amazing?",
  "What's next on your list?",
  "Ready for an adventure?",
  "What's on your schedule today?",
  "What will you discover?",
  "What's your next move?",
  "Up for a challenge?",
  "What's next for you?",
  "Learn something new today.",
  "Try something different today.",
  "Expand your horizons today.",
  "Find your next hobby today.",
  "What's your next experience?",
  "What's your plan for today?",
  "Time for a new adventure.",
  "Discover something new today.",
  "Make today count.",
  "Step out of your comfort zone today.",
  "What will you achieve today?",
  "Try something fun today.",
  "What's your next project?",
  "What's next?",
  "Adventure time!",
  "Your schedule?",
  "Discover more.",
  "What's your move?",
  "Take the challenge.",
  "Your next step?",
  "Learn something new.",
  "Try something new.",
  "Expand horizons.",
  "Find a new hobby.",
  "Your next experience?",
  "Your plan?",
  "New adventure?",
  "Discover something.",
  "Make it count.",
  "Step out today.",
  "Achieve something.",
  "Try something fun.",
  "Next project?",
  "What trouble can we get into today?",
  "Let's go on an adventure, friend!",
  "What's on the agenda for fun?",
  "What can we get up to today?",
  "Let's do something ridiculous!",
  "What mischief shall we make today?",
  "What wacky idea do you have for today?",
  "Let's get weird!",
  "What's the craziest thing we can do?",
  "What's our next shenanigan?",
  "Let's make some memories!",
  "What's the silliest thing we can do?",
  "Time to have some fun, pal!",
  "What's the most ridiculous thing we can think of?",
  "What's our next adventure, buddy?",
  "Let's do something that makes us laugh!",
  "What's the most outrageous idea we have?",
  "Let's get goofy!",
  "What's our next crazy scheme?",
  "Time to create some fun!",
  "What's next on your to-do list?",
  "What adventures await you today?",
  "What exciting plans do you have for today?",
  "What will you discover today?",
  "What's on your agenda for today?",
  "What's your next big move?",
  "What's your next adventure?",
  "What new experience will you have today?",
  "What's your next challenge?",
  "What new things will you learn today?",
  "What's next on your to-do list?",
  "What adventures await you today?",
  "What exciting plans do you have for today?",
  "What will you discover today?",
  "What's on your agenda for today?",
  "What's your next big move?",
  "What's your next adventure?",
  "What new experience will you have today?",
  "What's your next challenge?",
  "What new things will you learn today?",
  "What exciting new activities can you try today?",
  "What adventures are waiting for you today?",
  "What new skills can you learn today?",
  "What do you want to explore today?",
  "What activity will help you relax today?",
  "What exciting plans can you make today?",
  "What can you try today to step out of your comfort zone?",
  "What activity will keep you moving today?",
  "What new places can you discover today?",
  "What creative projects can you work on today?",
  "What's your next adventure, Indiana?",
  "What's your next mission, Ethan?",
  "What's your next move, Harry?",
  "What's your next discovery, Jane?",
  "What's your next creation, Wall-E?",
  "What's your next daring feat, Bond?",
  "What's your next journey, Bilbo?",
  "What's your next wild idea, Wonka?",
  "What's your next experiment, Doc?",
  "What's your next masterpiece, Remy?",
  "What's your next quest, Link?",
  "What's your next mission, Master Chief?",
  "What's your next adventure, Lara?",
  "What's your next plan, Tony?",
  "What's your next move, Neo?",
  "What's your next discovery, Ellie?",
  "What's your next innovation, Tony?",
  "What's your next exploration, Aloy?",
  "What's your next exploit, Nathan?",
  "What's your next achievement, Mario?",
  "What's your next adventure, Frodo?",
  "What's your next challenge, Kratos?",
  "What's your next heist, Dom?",
  "What's your next invention, Doc?",
  "What's your next mystery, Sherlock?",
  "What's your next experiment, Chell?",
  "What's your next discovery, Cooper?",
  "What's your next goal, Goku?",
  "What's your next exploration, Samus?",
  "What's your next journey, Geralt?",
  "What's next, Bilbo?",
  "What's next, Holmes?",
  "What's next, Santiago?",
  "What's next, Frankenstein?",
  "What's next, Alice?",
  "What's next, Pi?",
  "What's next, D'Artagnan?",
  "What's next, Holden?",
  "What's next, Robinson Crusoe?",
  "What's next, Gatsby?",
  "What's next, Maverick?",
  "What's next, Bond?",
  "What's next, Skywalker?",
  "What's next, Lara Croft?",
  "What's next, Mario?",
  "What's next, Hermione?",
  "What's next, Tony Stark?",
  "What's next, Captain America?",
  "What's next, Indiana Jones?",
  "What's next, Jason Bourne?",
  "What's next, Katniss?",
  "What's next, Neo?",
  "What's next, Tyrion?",
  "What's next, Arya?",
  "What's next, Bilbo?",
  "What's next, Legolas?",
  "What's next, Hermione?",
  "What's next, Sherlock?",
  "What's next, Gandalf?",
  "What's next, Dracula?",
  "What's next, Jon Snow?",
  "What's next, Eleven?",
  "What's next, Dexter?",
  "What's next, Sheldon?",
  "What's next, Walter White?",
  "What's next, Don Draper?",
  "What's next, Olivia Pope?",
  "What's next, Mindy Lahiri?",
  "What's next, Tyrion Lannister?",
  "What's next, Claire Underwood?",
  "What's next, Daenerys Targaryen?",
  "What's next, Ross and Rachel?",
  "What's next, Michael Scott?",
  "What's next, Carrie Bradshaw?",
  "What's next, Lorelai Gilmore?",
  "What's next, Nancy Botwin?",
  "What's next, House MD?",
  "What's next, Rick Grimes?",
  "What's next, Piper Chapman?",
  "What's next, Sherlock Holmes?",
  "Ready?",
  "Inspired?",
  "Believe?",
  "Empowered?",
  "Excited?",
  "Fearless?",
  "Motivated?",
  "Ambitious?",
  "Charged?",
  "Determined?",
  "Focused?",
  "Passionate?",
  "Unstoppable?",
  "Vibrant?",
  "Brave?",
  "Courageous?",
  "Persistent?",
  "Resilient?",
  "Eager?",
  "Optimistic?",
  "Tenacious?",
  "Achieving more today?",
  "Making progress today?",
  "Pursuing your passions today?",
  "Taking control today?",
  "Living your best life today?",
  "Creating your own path today?",
  "Being your best self today?",
  "Seizing the day?",
  "Making it happen today?",
  "Living without regrets today?",
  "Making every moment count?",
  "Shaping your destiny?",
  "Rising to the challenge?",
  "Pushing past limits?",
  "Breaking barriers?",
  "Turning dreams into reality?",
  "Writing your own story?",
  "Building a legacy?",
  "Making a difference?",
  "Chasing excellence?",
  "Striving for greatness?",
  "Living with purpose?",
  "Embracing change?",
  "Overcoming obstacles?",
  "Seizing opportunities?",
  "Going the extra mile?",
  "Taking risks?",
  "Investing in yourself?",
  "Leaving your mark?",
  "Creating a masterpiece?",
  "Making your mark?",
  "Following your heart?",
  "Creating your own luck?",
  "Taking the first step?",
  "Starting something new?",
  "Stepping out of your comfort zone?",
  "Fighting for what you believe?",
  "Living without fear?",
  "Living with intention?",
  "Challenging yourself?",
  "Redefining success?",
  "Living up to your potential?",
  "Being unstoppable?",
  "Being the change you wish to see?",
  "Living your dreams?",
  "Being extraordinary?",
  "Living with passion?",
  "Being the best version of yourself?",
  "Pursuing greatness?",
  "Carving your own path?",
  "Living life to the fullest?",
  "Creating a better tomorrow?",
  "Being a game changer?",
  "Living a life without limits?",
  "Making an impact?",
  "Living with grit?",
  "Becoming unstoppable?",
  "Achieving the impossible?",
  "Living with conviction?",
  "Being the best you?",
  "Making a statement?",
  "Building your legacy?",
  "Making your dreams a reality?",
  "Unleashing your potential?",
  "Living your best life?",
  "Being a trailblazer?",
  "Living with purpose and passion?",
  "Becoming the person you want to be?",
  "Making every day count?",
  "Being a catalyst for change?",
  "Taking the leap?",
  "Embracing challenges?",
  "Living with authenticity?",
  "Being fearless?",
  "Living with resilience?",
  "Creating a life you love?",
  "Being an inspiration?",
  "Being limitless?",
  "Breaking free from the ordinary?",
  "Being exceptional?",
  "Living without boundaries?",
  "Making your life a masterpiece?",
  "Being the driving force?",
  "Living with enthusiasm?",
  "Being unstoppable in the pursuit of your goals?",
  "Living in the moment?",
  "Being bold and courageous?",
  "Going after what you want?",
  "Being unstoppable in the face of adversity?",
  "Making things happen?",
  'Thrive',
  'Succeed',
  'Believe',
  'Conquer',
  'Create',
  'Innovate',
  'Explore',
  'Achieve',
  'Persevere',
  'Transform',
  'Progress',
  'Dream',
  'Inspire',
  'Chase',
  'Adapt',
  'Unleash',
  'Overcome',
  'Evolve',
  'Grow',
  'Rise',
  'Challenge',
  'Learn',
  'Develop',
  'Advance',
  'Excel',
  'Imagine',
  'Invent',
  'Master',
  'Prosper',
  'Sustain',
  'Thrive',
  'Triumph',
  'Victory',
  'Breakthrough',
  'Elevate',
  'Flourish',
  'Surpass',
  'Contribute',
  'Influence',
  'Lead',
  'Empower',
  'Impact',
  'Inspire',
  'Motivate',
  'Nurture',
  'Foster',
  'Pioneer',
  'Revolutionize',
  'Stimulate',
  'Thrive',
  'Transcend',
  'Unify',
  'Uplift',
  'Actualize',
  'Catalyze',
  'Energize',
  'Fulfill',
  'Galvanize',
  'Manifest',
  'Optimize',
  'Revitalize',
  'Synergize',
  'Unleash',
  'Cultivate',
  'Fortify',
  'Intensify',
  'Magnify',
  'Potentiate',
  'Reinforce',
  'Solidify',
  'Strengthen',
  'Empower',
  'Equip',
  'Facilitate',
  'Promote',
  'Enable',
  'Enrich',
  'Fuel',
  'Magnify',
  'Maximize',
  'Multiply',
  'Sustain',
  'Thrive',
  'Transform',
  "Why not?",
  "Let's go!",
  "Ready, set?",
  "Keep pushing!",
  "Believe in?",
  "Get moving!",
  "Dream big!",
  "Think different!",
  "Make it!",
  "No excuses!",
  "Take action!",
  "Level up!",
  "Unleash power!",
  "Stay hungry!",
  "Never settle!",
  "Be unstoppable!",
  "Find courage!",
  "Stay focused!",
  "Get started!",
  "Rise up!",
  "Why wait?",
  "Take chances!",
  "Feel alive!",
  "Stay positive!",
  "Stay strong!",
  "Stay curious!",
  "Create change!",
  "Be bold!",
  "Stay fearless!",
  "Embrace change!",
  "Stay determined!",
  "Take control!",
  "Make progress!",
  "Stay motivated!",
  "Believe in yourself!",
  "Trust yourself!",
  "Take risks!",
  "Make moves!",
  "Stay committed!",
  "Stay inspired!",
  "Find passion!",
  "Stay resilient!",
  "Stay hungry!",
  "Stay thirsty!",
  "Be unstoppable!",
  "Stay relentless!",
  "Stay ambitious!",
  "Stay driven!",
  "Stay hungry!",
  "Stay foolish!",
  "Never give up!",
  "Keep moving forward!",
  "Dream big dreams!",
  "Find your passion!",
  "Push your limits!",
  "Embrace the challenge!",
  "Make it happen!",
  "Take massive action!",
  "Stay focused always!",
  "Choose your path!",
  "Overcome all obstacles!",
  "Stay positive always!",
  "Believe in yourself!",
  "Chase your dreams!",
  "Create your reality!",
  "Challenge your limits!",
  "Live life fully!",
  "Stay hungry always!",
  "Rise above it!",
  "Persevere and succeed!",
  "Keep grinding always!",
  "Stay true always!",
  "Stay the course!",
  "Stay persistent always!",
  "Create your destiny!",
  "Be unstoppable force!",
  "Never back down!",
  "Strive for greatness!",
  "Reach for stars!",
  "May the force be with you.", // Star Wars
  "I'll be back.", // The Terminator
  "You talking to me?", // Taxi Driver
  "Here's Johnny!", // The Shining
  "Houston, we have a problem.", // Apollo 13
  "Hasta la vista, baby.", // Terminator 2: Judgment Day
  "Why so serious?", // The Dark Knight
  "I'm king of the world!", // Titanic
  "Say hello to my little friend.", // Scarface
  "Life is like a box of chocolates.", // Forrest Gump
  "You can't handle the truth!", // A Few Good Men
  "To infinity and beyond!",
  "I feel the need...the need for speed.",
  "Nobody puts Baby in a corner.",
  "You're killing me, Smalls.",
  "I'm not bad. I'm just drawn that way.",
  "My precious.",
  "I see dead people.",
  "There's no place like home.", // The Wizard of Oz
  "That'll do, pig. That'll do.", // Babe
  "Just keep swimming.",
  "I am your father.", // Star Wars: Episode V - The Empire Strikes Back
  "I'll never let go, Jack.", // Titanic
  "Here's looking at you, kid.", // Casablanca
];
