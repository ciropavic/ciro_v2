import React from "react";
import { Text, Flex, Box } from "@chakra-ui/react";
import { useNuiEvent } from "../../hooks/useNuiEvent";
import { debugData } from "../../utils/debugData";
import { fetchNui } from "../../utils/fetchNui";

interface Props {
  label: string;
  duration: number;
}

debugData([
  {
    action: "progress",
    data: {
      label: "Using Lockpick",
      duration: 8000,
    },
  },
]);

const Progressbar: React.FC = () => {
  const [visible, setVisible] = React.useState(false);
  const [label, setLabel] = React.useState("");
  const [duration, setDuration] = React.useState(0);
  const [cancelled, setCancelled] = React.useState(false);

  const progressComplete = () => {
    setVisible(false);
    fetchNui("progressComplete");
  };

  const progressCancel = () => {
    setCancelled(true);
    setTimeout(() => {
      setVisible(false);
    }, 2500);
  };

  useNuiEvent("progressCancel", progressCancel);

  useNuiEvent<Props>("progress", (data) => {
    setCancelled(false);
    setVisible(true);
    setLabel(data.label);
    setDuration(data.duration);
  });

  return (
    <Flex
      h="10%"
      w="100%"
      position="absolute"
      bottom="13vh"
      justifyContent="center"
      alignItems="center"
    >
      <Box width="28vh">
        {visible && (
          <Box
            height="4vh"
            bg="rgba(0, 0, 0, 0.6)"
            border="2px solid #fff"
            textAlign="center"
            
            borderRadius="sm"
            boxShadow="lg"
            overflow="hidden"
            
          >
            <Box
              height="4vh"
              onAnimationEnd={progressComplete}
              sx={
                !cancelled
                  ? {
                      width: "0%",
                      backgroundColor: "#3498db",
                      animation: "progress-bar linear",
                      animationDuration: `${duration}ms`,
                    }
                  : {
                      width: "100%",
                      animationPlayState: "paused",
                      backgroundColor: "rgb(198, 40, 40)",
                    }
              }
            />
            <Text
              fontFamily="Signika"
              fontSize="1.25em"
              isTruncated
              fontWeight={400}
              position="absolute"
              top="50%"
              left="50%"
              transform="translate(-50%, -50%)"
            >
              {label}
            </Text>
          </Box>
        )}
      </Box>
    </Flex>
  );
};

export default Progressbar;
