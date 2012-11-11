function [joints]=joints2solver(joint0, joint1, joint2, joint3)
    joints = degtorad([joint0, 90-joint1, 90+joint2, 90+joint3, 0, 0, 0]);
end